pkgname=915resolution
pkgver=0.5.3
pkgrel=1
pkgdesc='A tool to modify the video BIOS of the 800 and 900 series Intel graphics chipsets'
url='http://915resolution.mango-lang.org/'
license=('custom:Public Domain')
source=("http://915resolution.mango-lang.org/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b64cab834b5e410bca555dc9db8e69f62f6f02496942f35ff4a68f3f27f1b542')
arch=('i686' 'x86_64')
depends=('bash')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Clean out the bundled binaries.
  make clean
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Build it!
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the program.
  install -Dm755 915resolution "${pkgdir}/usr/bin/915resolution"
  install -Dm755 dump_bios "${pkgdir}/usr/bin/915dump_bios"

  # Install the license.
  install -Dm755 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh ts=2 sw=2 et
