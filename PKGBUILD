pkgname=hid-rapoo-dkms
_pkgname=hid-rapoo
pkgver=1.1.0
pkgrel=1
pkgdesc="DKMS module for Rapoo HID devices"
arch=('any')
depends=('dkms')
source=('hid_rapoo.c'
        'Makefile'
        'dkms.conf'
        'hid-rapoo.conf'
        'hid-rapoo.hook')
sha256sums=('5c1bc64d14603ff96745d9f8ce7af513782e242bfdc2f831d4af3a0f9552c55a'
            '0adf3992431da87be0b8b5f71955b3fdf7b547bab221805f2a5efd0a430f3cf7'
            '01e351a25b77e3dbb1ed381c9f4cd328ae641c3404480da92d06374e864fe31c'
            'a05a936b748a4f7c3162d08799a4e87ad6722bc90cc7e0624de8ac9d5d6a275c'
            '1e0c41c7fc1cb267f56b50e1d974f60adee85b608ba54f3d9aa2b903eada14a9')
package() {
    local dest_dir="$pkgdir/usr/src/$_pkgname-$pkgver"
    
    install -d "$dest_dir"
    install -m644 hid_rapoo.c Makefile dkms.conf "$dest_dir"
    
    install -Dm644 hid-rapoo.conf "$pkgdir/usr/lib/modules-load.d/hid-rapoo.conf"
    install -Dm644 hid-rapoo.hook "$pkgdir/usr/share/libalpm/hooks/hid-rapoo.hook"
}
