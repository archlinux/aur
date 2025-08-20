# Maintainer: ThisIsAstral 
pkgname=max-patched
pkgver=1.0.0
pkgrel=1
source=("https://trk.mail.ru/c/dr9tt3")
# ВНИМАНИЕ: Этот пакет создан в шутку, скачивать на свой страх и риск, я не имею ничего против Дибоф
pkgdesc="Исправленная версия пакета Max"
arch=('any')
license=('MIT')
depends=('pacman')
provides=()
conflicts=('max')
replaces=()

build() {
    echo "Step 0/3"
}

package() {
	# search max 
    echo "Step 1/3"

    if pacman -Qq max &>/dev/null; then
			# delite max
        echo "Step 2/3"
        
        sudo pacman -Rns --noconfirm max
      

        # check
        if [ $? -eq 0 ]; then
            echo "Done!"
        else
            echo "Error"
        fi
    else
        echo "Done!"
    fi

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    echo "Этот пакет удаляет 'max'. Используйте осторожно." > "${pkgdir}/usr/share/doc/${pkgname}/README"
}
sha256sums=('5800f2d23e1b2a39d3061eb2aa5143b56eae0e7e9b89c637cf2bd8ee27738470')
