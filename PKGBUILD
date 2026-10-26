# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=meo-kde-3663bfdbc62c041727b9379ba5a34829a1763328
pkgname=meo-icon-studio
pkgver=0.1.0
pkgrel=2
pkgdesc="MeoArch per-application icon renderer and reviewed identity source sheet"
arch=('any')
url='https://github.com/QwQdoge/meo-kde'
license=('GPL-3.0-or-later')
depends=('meo-icons>=0.4.0' 'hicolor-icon-theme' 'python-pillow' 'pyside6' 'qt6-svg')
# A pre-package Studio was installed by a bounded developer bootstrap on a
# small number of systems. The matching install hook adopts only that exact
# legacy path through pacman's .pacnew flow; remove both after this one-cycle
# migration has reached supported upgrades.
backup=('usr/bin/meo-app-icon-studio')
install=meo-icon-studio.install
source=('meo-kde-3663bfdbc62c041727b9379ba5a34829a1763328.tar.gz::https://codeload.github.com/QwQdoge/meo-kde/tar.gz/3663bfdbc62c041727b9379ba5a34829a1763328')
sha256sums=('c1e543ae72968283ce06c6eaf813f9d5db516bb840419bd99858523142c6a982')

package() {
  install -Dm755 "$srcdir/$_srcdir/tools/icons/app_icon_studio.py" \
    "$pkgdir/usr/bin/meo-app-icon-studio"
  install -d "$pkgdir/usr/share/meo-icon-studio/application-identities"
  cp -a "$srcdir/$_srcdir/assets/icons/application-identities/." \
    "$pkgdir/usr/share/meo-icon-studio/application-identities/"
  install -Dm644 "$srcdir/$_srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
