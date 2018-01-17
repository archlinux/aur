pkgname=virtualbox51-guest-iso
pkgver=5.1.32
pkgrel=1
pkgdesc='The official VirtualBox Guest Additions ISO image'
arch=('any')
url='http://www.virtualbox.org'
license=('custom:PUEL')
install=virtualbox-guest-iso.install
replaces=('virtualbox-additions' 'virtualbox-iso-additions' 'virtualbox-guest-iso')
conflicts=('virtualbox-additions' 'virtualbox-iso-additions' 'virtualbox-guest-iso')
noextract=(VBoxGuestAdditions_$pkgver.iso)
source=("http://download.virtualbox.org/virtualbox/$pkgver/VBoxGuestAdditions_$pkgver.iso"
        'license')
sha256sums=('f6dfb5568c6ce98ae48540fb0297e31ae5c93524e1e91b235dd2f1aef5b1e31a'
            'fbe9cd6288037bff44716642ee4bea9c42c2d60eb5ed86cb48fa95147d9e8623')

package() {
  install -Dm 644 VBoxGuestAdditions_$pkgver.iso \
    "$pkgdir/usr/lib/virtualbox/additions/VBoxGuestAdditions.iso"
  install -Dm 644 "$srcdir/license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
