# Maintainer: zh99998 <zh99998@gmail.com>

pkgname=splunk-forwarder
pkgver=6.3.0
pkgrel=2
pkgdesc='Universal Forwarders provide reliable, secure data collection from remote sources and forward that data into Splunk (Enterprise, Light, Cloud or Hunk) for indexing and consolidation.'
arch=('x86_64')
url='http://www.splunk.com/en_us/download/universal-forwarder.html'
source=('splunkforwarder-6.3.0-aa7d4b1ccb80-Linux-x86_64.tgz::http://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=6.3.0&product=universalforwarder&filename=splunkforwarder-6.3.0-aa7d4b1ccb80-Linux-x86_64.tgz&wget=true'
        'splunk-forwarder.service'
)

md5sums=(
'30d10aa4a199e932ec0083dcc3501fe3'
'SKIP'
)

package() {
#TODO: install to system path rather than /opt
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/bin"
	mv "$srcdir/splunkforwarder" "$pkgdir/opt"
	ln -sf "$pkgdir/opt/splunkforwarder/bin/splunk" "$pkgdir/usr/bin/splunk"
        install -Dm644 "$srcdir/splunk-forwarder.service" "$pkgdir/usr/lib/systemd/system/splunk-forwarder.service"
}

