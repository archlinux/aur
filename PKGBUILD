# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=whatsapp-nativefier-autostart-tray-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to enable autostart and start in tray whatsapp-nativefier"
arch=("any")
license=("GPL3")
depends=('whatsapp-nativefier')
conflicts=('whatsapp-nativefier-notray-hook')
source=(${pkgname%-hook}.hook ${pkgname%-hook} whatsapp-nativefier.desktop)
sha256sums=('6c92da644a32fba9d7a5a2a82d8ac8a33e130ad4497b784e056026e733e2d762'
            '9a9ae3cc6ec17e81d761a7397b17860a558f72e8802c62fe113f60bf05975732'
            'bad0489ae519bc78afab3d226966691feede8bcedf58025af1b171215ae51423')

package() {
  install -Dm775 whatsapp-nativefier.desktop -t "$pkgdir"/etc/xdg/autostart
  install -Dm644 ${pkgname%-hook}.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -Dm775 ${pkgname%-hook} -t "$pkgdir"/usr/share/libalpm/scripts
}
