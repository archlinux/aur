# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-theme-opensuse
_pkgname=fcitx5-theme-opensuse
pkgver=0.0.0.20201110
_commit=62ed596f9585344e95b6e05cbb750c7f622dd82a
pkgrel=1
pkgdesc="Fcitx5 theme on openSUSE, including Dartmouth, Harlequin, and New Air "
arch=('any')
url="https://github.com/xuzhao9/fcitx5-theme-opensuse"
license=('LGPL2.1')
source=("https://github.com/xuzhao9/fcitx5-theme-opensuse/archive/$_commit/$_pkgname-$_commit.tar.gz")
b2sums=('1d41830e720293e033085e08f6f8d4c21cf04604094d414e74909ad5e7395a4afa06d81f70d8447164c0dead89a9f184606cca21832fb1887eb4a1f356ca6768')

package() {
  cd $_pkgname-$_commit
  _variant_names=('Dartmouth' 'Harlequin' 'NewAir')
  for _variant_name in "${_variant_names[@]}"
  do
    install -Dm644 $_variant_name/highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
    install -Dm644 $_variant_name/bar.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/bar.png
    install -Dm644 $_variant_name/theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
  done

  #install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
