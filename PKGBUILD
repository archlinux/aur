# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=golismero
pkgver=2.0Beta3
pkgrel=1
pkgdesc="Is a free software framework for security testing. It's currently geared towards web security, but it can easily be expanded to other kinds of scans."
arch=('any')
url="http://www.golismero.com/"
license=('GPL2')
depends=('python2' 
	 'python2-beautifulsoup3' 
	 'python2-colorizer' 
	 'python2-decorator' 
	 'python2-django>=1.8' 
	 'python2-dnspython' 
	 'python2-netaddr' 
	 'python2-nltk'
	 'python2-cjson'
	 'python2-requests'
	 'python2-requests_ntlm'
	 'python2-texttable'
	 'python2-tldextract'
	 'python2-pymongo>=2.8'
	 'python-simplejson')
provides=('golismero')
source=("git+https://github.com/golismero/golismero.git")

package() {
  msg2 "Installing golismero..."
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cd "${srcdir}/${pkgname}"
  cp -aRp --copy-contents * "${pkgdir}/usr/share/${pkgname}"

cat > $pkgdir/usr/bin/golismero << "EOF"
#!/bin/bash
cd /usr/share/golismero/ && python2 golismero.py "$@"
EOF
chmod 755 "$pkgdir/usr/bin/golismero"
}
sha256sums=('SKIP')
