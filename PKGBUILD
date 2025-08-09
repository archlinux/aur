# Maintainer: TNE <tne@garudalinux.org>
# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=garuda-update
pkgdesc="The Garuda Linux update command, in a separate package to allow separate updating"
pkgver=4.12.0
pkgrel=1
arch=('any')
license=('GPL')
depends=('coreutils' 'sed' 'gawk' 'pacman' 'wget')
backup=(etc/garuda/garuda-update/config)
source=("auto-pacman"
  "config"
  "garuda-update"
  "help"
  "logrotate"
  "main-update"
  "update-helper-scripts")
sha512sums=('b782d8f5c756fb9a647833dfc510b60e56d276080c11594beecbfb9ee5b24cb7e164f9cb0a750d60030d9a042aa416bb16a1681c77edc9face38030b3cd99e50'
            'd5dbe3e4a47e9b5301d1e849c54f2632540f14878e6af4f11979d74fc0be1c36321229cf5128924251431087aa42c497c0ab57e0743973c9baaeccc24114e2e1'
            '04a629a3942647167c73d0695ce3d76a18eafa84e788ba0708375860562466d9ce4119a51cb0e39c150ea4b847269d65de63093e594f8be1f30bdf34d185cac5'
            '4a9d6c017b8e6763a574a98d4e6c1e7a3520716c4f74f28bdb1a0bc35ffe9b0e859d5c03d413720e6477218509e3ca24ad701202e46158c6197d660e3ef9d60f'
            'fd112c212c43d631740be11064e1fd4cc3023d0951e945445173def152e8930189575654ddac0eb34ffd6a2eb5670c47993aeda66ab8fa089583ec973026e7de'
            '2ed3a65ca13232c10db568f0422bce1af66c002685becd8da4f32961db4c8278a0cb1c761c689826721142758a315928687bbc3ab2a1be12b6ec01b3640d3b43'
            '5515690bc9ec25d96385389a33ec9f1512e853be9ad62414c7045455c2548e32dcd171dceedb8ef075c2210fefc7be4e83c5899be3947b8eeb2ad297ca20b726')

package() {
  install -Dm755 garuda-update "$pkgdir"/usr/bin/garuda-update
  ln -s /usr/bin/garuda-update "$pkgdir"/usr/bin/update
  install -Dm644 config "$pkgdir"/etc/garuda/garuda-update/config
  install -Dm644 logrotate "$pkgdir"/etc/logrotate.d/garuda-update
  install -Dm755 auto-pacman "$pkgdir"/usr/lib/garuda/garuda-update/auto-pacman
  install -Dm755 help "$pkgdir"/usr/lib/garuda/garuda-update/help
  install -Dm755 main-update "$pkgdir"/usr/lib/garuda/garuda-update/main-update
  install -Dm755 update-helper-scripts "$pkgdir"/usr/lib/garuda/garuda-update/update-helper-scripts
}
