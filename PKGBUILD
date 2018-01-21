pkgname=go-bin
pkgver=1.9.2
pkgrel=1
provides=('go')
pkgdesc='Compiler and tools for the Go programming language from Google'
arch=('x86_64')
url='http://golang.org/'
license=('custom')
depends=('bash' 'perl')
optdepends=('java-environment: for running testsuite')
options=('!strip' 'staticlibs')
sha1sums_x86_64=('94c889e039e3d2e94ed95e8f8cb747c5bc1c2b58'
                 '0428eb2625009006fe0a64883ec74f528c7a02c6')
source_x86_64=("https://storage.googleapis.com/golang/go${pkgver}.linux-amd64.tar.gz" etcgobin)

package() {
  install -d "$pkgdir"/opt
  tar -C "$pkgdir"/opt -xzf go${pkgver}.linux-*.tar.gz
  install -Dm755 "$srcdir"/etcgobin "$pkgdir"/etc/profile.d/go-bin.sh
  install -Dm644 "$srcdir"/go/LICENSE "$pkgdir"/usr/share/licenses/go-bin/LICENSE
}
