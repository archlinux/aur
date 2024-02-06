# Maintainer: iddt <iddt@users.noreply.github.com>
# Contributor: Dmitry Iv. <df.creative@gmail.com>

_name='linefont'
pkgname=otf-linefont-git
pkgver=20231029
pkgrel=1
pkgdesc='Font for rendering line charts.'
arch=('any')
url="https://github.com/dy/${_name}"
license=('OFL')
makedepends=('git')
provides=("${pkgname}")
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "${srcdir}/${_name}"
  install -Dm644 -t $pkgdir/usr/share/fonts/OTF fonts/otf/*.otf
  install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname OFL.txt
}

