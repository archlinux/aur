# Maintainer: TNE <tne@garudalinux.org>
# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=garuda-update
pkgdesc="The Garuda Linux update command, in a separate package to allow separate updating"
pkgver=4.8.7
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
sha512sums=('bb43394893ce77e197a85140b472e60a055b630f4c9aca4f51e22d03e2c043f4331acedbc1a1474a64013a65cf9f194aed940112971597bd4e16949994d7655c'
  'd5dbe3e4a47e9b5301d1e849c54f2632540f14878e6af4f11979d74fc0be1c36321229cf5128924251431087aa42c497c0ab57e0743973c9baaeccc24114e2e1'
  '04a629a3942647167c73d0695ce3d76a18eafa84e788ba0708375860562466d9ce4119a51cb0e39c150ea4b847269d65de63093e594f8be1f30bdf34d185cac5'
  '4a9d6c017b8e6763a574a98d4e6c1e7a3520716c4f74f28bdb1a0bc35ffe9b0e859d5c03d413720e6477218509e3ca24ad701202e46158c6197d660e3ef9d60f'
  'fd112c212c43d631740be11064e1fd4cc3023d0951e945445173def152e8930189575654ddac0eb34ffd6a2eb5670c47993aeda66ab8fa089583ec973026e7de'
  'ce36faffd0ca18cb84c6c3cdd33c5f23ed9ef2478c09c8a251e2c82db9e942e95ac64f002449568984d58cfab2ae02a632e23b92c61c2e0f594a6ed4f1a5ef6a'
  '541897d102c5ba4f100e34b2e1fa2becc5414e1d5f2241098b55ee0b9704e97af9dcad014f19b2c0e02291269f7fb92c22d22c4d5aad10042c51cb142aa6ab17')

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
