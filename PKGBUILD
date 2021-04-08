# Maintainer: taotieren <admin@taotieren.com>

pkgname=qt5-base-util
_pkgname=qt5-base
pkgver=5.15.2+kde+r171
pkgrel=1
_commit=cb2da673f53815a5cfe15f50df49b98032429f9e
arch=(x86_64)
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework'
depends=('qt5-base' 'git')
makedepends=()
optdepends=()
groups=('qt' 'qt5')
_pkgfn=qtbase
source=('git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgfqn
  echo "5.15.2+kde+r"`git rev-list --count origin/5.15.2..$_commit`
}

package()
{
    install -dm755 "${pkgdir}/opt/qt/qt5/${_pkgname}/"
    cp -r "${srcdir}/${_pkgfn}/util" "${pkgdir}/opt/qt/qt5/${_pkgname}/"
}
