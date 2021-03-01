# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=gssg-git
_pkgname=gssg
pkgver=0.1.747b6b41
pkgrel=1
pkgdesc='Gemini static site generator'
url='https://git.sr.ht/~gsthnz/gssg'
arch=('x86_64')
license=('GPL3')
makedepends=('go' 'git')
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd ${_pkgname}
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" "$pkgdir/opt/${_pkgname}/README.md"

  install -Dm755 "${srcdir}/${_pkgname}/gssg" "$pkgdir/opt/$_pkgname/gssg"
  # links binary to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/gssg "${pkgdir}/usr/bin"
}
