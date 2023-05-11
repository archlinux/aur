# Maintainer: tkirishima <tkirishima@proton.me>
pkgname=langfetch
pkgver=0.0.1
pkgrel=2
pkgdesc="A command-line tool to display the version of languages on your system"
arch=("any")
url="https://github.com/aderepas/langfetch"
license=('MIT')
depends=(
    'python>=3.10'
)

source=(
  "${pkgname}::git+$url.git"
)

sha256sums=( 'SKIP' )

package() {
  cd "${srcdir}/${pkgname}/src"
  /usr/bin/python replace.py
  install -Dm755 main.py "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 languages.json "${pkgdir}/usr/share/${pkgname}/languages.json"
}
