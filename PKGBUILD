pkgname=go-bin
pkgver=1.10.1
pkgrel=3
provides=('go')
pkgdesc='Compiler and tools for the Go programming language from Google'
arch=('x86_64' 'i686')
url='http://golang.org/'
license=('custom')
depends=('bash' 'perl')
optdepends=('java-environment: for running testsuite')
options=('!strip' 'staticlibs')
sha256sums_x86_64=('72d820dec546752e5a8303b33b009079c15c2390ce76d67cf514991646c6127b'
                 '4eaad54a24d35bf72234011eb141e6a0b712b9703587747792f9aeed1c1faf2b')
source_x86_64=("https://storage.googleapis.com/golang/go${pkgver}.linux-amd64.tar.gz" etcgobin)
sha256sums_i686=('acbe19d56123549faf747b4f61b730008b185a0e2145d220527d2383627dfe69'
               '4eaad54a24d35bf72234011eb141e6a0b712b9703587747792f9aeed1c1faf2b')
source_i686=("https://storage.googleapis.com/golang/go${pkgver}.linux-386.tar.gz" etcgobin)

package() {
  install -d "$pkgdir"/opt
  tar -C "$pkgdir"/opt -xzf go${pkgver}.linux-*.tar.gz
  install -Dm755 "$srcdir"/etcgobin "$pkgdir"/etc/profile.d/go-bin.sh
  install -Dm644 "$srcdir"/go/LICENSE "$pkgdir"/usr/share/licenses/go-bin/LICENSE
}
