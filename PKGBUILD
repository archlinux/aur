# Maintainer: txtdv <mveremeev25@gmail.com>
pkgname=cwatch
pkgver=0.7.0
pkgrel=1
pkgdesc="Similar to watch or hwatch, but supporting terminal formatting, making commands such as fastfetch properly work, along with actually proper colour support."
arch=('any')
url="https://www.github.com/textdev-0/cwatch"
license=('MIT')

# Dependencies: python for the interpreter, util-linux for the 'script' command
depends=('python' 'util-linux')

source=("${pkgname}.py")
sha256sums=('7e0daded6d89f97d3a528d1a241b341ffc3046ffc0f6edbd516cc4443ef9a3ea') 

source+=("LICENSE")
sha256sums+=('d727d1ca3421c68d924a4c5729913cb8bf0361b7a8cf48fa6fa83053f11a6a5b')


package() {
    # Install the script to /usr/bin/
    # -D creates parent directories if they don't exist
    # -m755 sets permissions to rwxr-xr-x (executable)
    install -Dm755 "${srcdir}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
