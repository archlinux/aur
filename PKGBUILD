# Maintainer: TNE <tne@garudalinux.org>
# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=garuda-update
pkgdesc="The Garuda Linux update command, in a separate package to allow separate updating"
pkgver=4.13.1
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
sha512sums=('9b352e422457de3879cf01e4d191a542ea45bd9f1b58010b47214e51159942f15bb8eb306a6db58ef51a450561934f590ede67628212a00809f2f922a73c5a03'
            'd5dbe3e4a47e9b5301d1e849c54f2632540f14878e6af4f11979d74fc0be1c36321229cf5128924251431087aa42c497c0ab57e0743973c9baaeccc24114e2e1'
            '04a629a3942647167c73d0695ce3d76a18eafa84e788ba0708375860562466d9ce4119a51cb0e39c150ea4b847269d65de63093e594f8be1f30bdf34d185cac5'
            '4a9d6c017b8e6763a574a98d4e6c1e7a3520716c4f74f28bdb1a0bc35ffe9b0e859d5c03d413720e6477218509e3ca24ad701202e46158c6197d660e3ef9d60f'
            'fd112c212c43d631740be11064e1fd4cc3023d0951e945445173def152e8930189575654ddac0eb34ffd6a2eb5670c47993aeda66ab8fa089583ec973026e7de'
            'e2cd40a0a259d7681057a6a7108475561eb820591c55025604eb8b406c72c9011998cec6085f13278b989f71ecfff3cf2bcad3b3e895f42b48ff3149c1c4123a'
            '33e9ff25270575f8a1fb8dde9047612a81c7b9129083b53a8b03ad3405e6f59480580d4d74cd76954d613ff488a2c1a9677f3c28441fba5ea2ee669922c5878f')

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
