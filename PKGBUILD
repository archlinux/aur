pkgname=go-bin
pkgver=1.11
pkgrel=3
provides=('go')
pkgdesc='Compiler and tools for the Go programming language from Google'
arch=('x86_64' 'i686')
url='http://golang.org/'
license=('custom')
depends=('bash' 'perl')
optdepends=('java-environment: for running testsuite')
options=('!strip' 'staticlibs')
sha256sums_x86_64=('b3fcf280ff86558e0559e185b601c9eade0fd24c900b4c63cd14d1d38613e499'
                 '4eaad54a24d35bf72234011eb141e6a0b712b9703587747792f9aeed1c1faf2b')
source_x86_64=("https://storage.googleapis.com/golang/go${pkgver}.linux-amd64.tar.gz" etcgobin)
sha256sums_i686=('1a91932b65b4af2f84ef2dce10d790e6a0d3d22c9ea1bdf3d8c4d9279dfa680e'
               '4eaad54a24d35bf72234011eb141e6a0b712b9703587747792f9aeed1c1faf2b')
source_i686=("https://storage.googleapis.com/golang/go${pkgver}.linux-386.tar.gz" etcgobin)

package() {
  install -d "$pkgdir"/opt
  tar -C "$pkgdir"/opt -xzf go${pkgver}.linux-*.tar.gz
  install -Dm755 "$srcdir"/etcgobin "$pkgdir"/etc/profile.d/go-bin.sh
  install -Dm644 "$srcdir"/go/LICENSE "$pkgdir"/usr/share/licenses/go-bin/LICENSE
}
