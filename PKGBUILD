# Maintainer: TNE <tne@garudalinux.org>

pkgname=garuda-libs
pkgdesc="Libraries commonly used by Garuda Linux software"
pkgver=1.5.2
pkgrel=1
arch=('any')
license=('GPL')
depends=('libnotify' 'expect')
optdepends=('alacritty' 'lxterminal' 'konsole' 'gnome-terminal' 'xfce4-terminal' 'xterm')
source=("launch-terminal" "garuda.shlib" "is-snapshot-boot" "install-software" "org.garuda.libs.pkexec.policy" "pkexec-gui")
sha512sums=('351941ad20ab2e1bc7d1a1f7b690fcda86badddd8f17e40ed62af28eac9be1eeb6d7e7c079dcc08cb61c618d08bd108e1c3c8a8a8cd7ba674036fe7cbea80361'
  'c93d39c8616d58ba38fc792900c8a05ee573a3571d79d208957eae2ee40147bbee200b7c78e0b24ad52125121deb3d8dbb6fe856c1b291f5b852148a7eaa5925'
  '2ba2701c933b37fd708efe9cd8a2dc9e17d33f6c7ecafcdd3ffd4292b5d88cde10595e15af1560b8c03bd3e1b94e13a69d23d72899ec75b500856c71bd23c446'
  'aa5ade90651d4b2ee9199277c7b8737ca717d69d4e7a0afc37e06542ba5dc34f33d8c8b50c0a79920c8fb7c71cc60e8b59fcca39055cfda589725401afe1ca30'
  '80987b22253b99ba62ebc63d35455949747a5d530afc72782891319a803c2fa2d78ee831a8eb95069d6209bf0f46da6c5be84fc484e84b77054fcb9b6d89b5cd'
  '3f64fb8e65bf31290aec17716adc79516be9fad9c5b918d6c49ab0e7eba615ab5b7da8a53feda3d952af283be381b75ef277213ac8d03d683fcf163a96d54735')

package() {
  install -Dm755 launch-terminal "$pkgdir"/usr/lib/garuda/launch-terminal
  install -Dm755 install-software "$pkgdir"/usr/lib/garuda/install-software
  install -Dm755 is-snapshot-boot "$pkgdir"/usr/lib/garuda/is-snapshot-boot
  install -Dm755 pkexec-gui "$pkgdir"/usr/lib/garuda/pkexec-gui
  install -Dm644 garuda.shlib "$pkgdir"/usr/lib/garuda/garuda.shlib
  install -d "$pkgdir"/var/lib/garuda/tmp

  install -Dm0644 org.garuda.libs.pkexec.policy "$pkgdir/usr/share/polkit-1/actions/org.garuda.libs.pkexec.policy"
}
