# Maintainer: <   Ron  Varburg  AT  yahoo  com   >

pkgname=powerofforreboot.efi
pkgver=20190517
pkgrel=2
pkgdesc="Utilities to be used from within a UEFI boot manager or shell"
license=('GPL-2.0-only')
arch=('i686' 'x86_64')
makedepends=('gnu-efi-libs')
source=('Makefile' 'poweroff.c' 'reboot.c' 'readme')
sha512sums=('3acb13934bb2c0a07f29cd14134bc40ad9e11a09635a40a26be39d173395656308671bedf9128cc634645b7b782b488b58f128b6ac536d7852e7346fd809970e' # Makefile
            '101fbb26dfce18513463af53d43c357066e4bc1277866146a8b1893367196792a5a0ef428d59a692cd71c90baeeed8f90cfafaa44a2a2539f21b4f2243d12ea0' # poweroff.c
            '09876c713d9196e1e9bc365e27348756411d4cdce5c0ed721daea679ad6bfc05b4066cd2a6c051972b374f58b5a7dce864b8562bd313c4ed95abbe0ca61fdcf6' # reboot.c
            'd4651e2a1520781f9c942289c55b67fc64021279e6d656e9e266f232a8969065d13ae3159ee2db5ebe35a282c0544bb5e88dd5e1c0b869e71deecb6fb6e4ffea' # readme
           )

build() {
    make
}

package() {
    install --directory ${pkgdir}/usr/share/${pkgname}
    install --mode=-x,go=r --target-directory=${pkgdir}/usr/share/${pkgname} *.efi readme
}
