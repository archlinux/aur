pkgname=virtualbox51-guest-iso
pkgver=5.1.38
pkgrel=1
pkgdesc='The official VirtualBox Guest Additions ISO image'
arch=('any')
url='http://www.virtualbox.org'
license=('custom:PUEL')
install=virtualbox-guest-iso.install
replaces=('virtualbox-additions' 'virtualbox-iso-additions' 'virtualbox-guest-iso' 'virtualbox51-guest-iso')
conflicts=('virtualbox-additions' 'virtualbox-iso-additions' 'virtualbox-guest-iso')
noextract=(VBoxGuestAdditions_$pkgver.iso)
source=("http://download.virtualbox.org/virtualbox/$pkgver/VBoxGuestAdditions_$pkgver.iso"
        'license')
sha256sums=('0e7ee2c78ebf7cd0d3a933d51148bef04a64f64fb27ccf70d59cddf9ca1e517a'
            'fbe9cd6288037bff44716642ee4bea9c42c2d60eb5ed86cb48fa95147d9e8623')

package() {
  install -Dm 644 VBoxGuestAdditions_$pkgver.iso \
    "$pkgdir/usr/lib/virtualbox/additions/VBoxGuestAdditions.iso"
  install -Dm 644 "$srcdir/license" \
    "$pkgdir/usr/share/licenses/virtualbox-guest-iso/LICENSE"
}
