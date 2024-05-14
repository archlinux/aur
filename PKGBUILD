# Maintainer: Reverier-Xu <reverier.xu@outlook.com>
pkgname=fcitx5-skin-ori-git
_pkgname=fcitx5-skin-ori-git
pkgver=v0.1.r1.g9acce95
pkgrel=1
pkgdesc="A round corner and svg theme for fcitx5."
arch=('x86_64')
url="https://github.com/Reverier-Xu/Ori-fcitx5"
license=('MPL')
depends=('fcitx5')
makedepends=()
provides=()
source=('git+https://github.com/Reverier-Xu/Ori-fcitx5.git')
md5sums=('SKIP')
_name=Ori-fcitx5
prepare() {
  cd $_name
}

pkgver() {
  cd $_name
  git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
 # OriDark
 install -Dm644 "$_name"/OriDark/highlight.svg "$pkgdir"/usr/share/fcitx5/themes/OriDark/highlight.svg
 install -Dm644 "$_name"/OriDark/panel.svg "$pkgdir"/usr/share/fcitx5/themes/OriDark/panel.svg
 install -Dm644 "$_name"/OriDark/theme.conf "$pkgdir"/usr/share/fcitx5/themes/OriDark/theme.conf
 
 # OriLight
 install -Dm644 "$_name"/OriLight/highlight.svg "$pkgdir"/usr/share/fcitx5/themes/OriLight/highlight.svg
 install -Dm644 "$_name"/OriLight/panel.svg "$pkgdir"/usr/share/fcitx5/themes/OriLight/panel.svg
 install -Dm644 "$_name"/OriLight/theme.conf "$pkgdir"/usr/share/fcitx5/themes/OriLight/theme.conf
}
