# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.0.12
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python-adb_shell' 'python-biplist' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-rich' 'python-tld' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-pip' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        'LICENSE')
sha512sums=('3f9144484189185e9aa22d5b5eedad1bd86e38872a5062cf645e6294db58311d1074c4a2a2728d4eb91310f6d8a30f3665f0b347710e812a0fd6cab832368a65'
            'e6419cdb8af21967a5538d22ed85678e72bdb091768f65ab3d585f9eeec99918a57032eeaede98f3d1fdfb3677ac4fb5af8f2b390a2eaf047186db184936fd5b')

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "mvt-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
