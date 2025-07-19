# Maintainer: Fikriansyah Ahmadinejad <ahmadinne@proton.me>
pkgname=currento
pkgver=1.2
pkgrel=1
pkgdesc="Extend the basic 'cd' command. Currento adds features that shouldn't be in basic 'cd'."
arch=("any")
url="https://github.com/ahmadinne/currento"
license=("GPL-3.0-or-later")
depends=("bash" "git")
source=("${pkgname}::git+https://github.com/ahmadinne/currento.git")
md5sums=("SKIP")

package() {
    cd "${pkgname}"
    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    if [[ $(cat $HOME/.bashrc | grep -x -c "source /usr/bin/currento") != 1 ]]; then 
        echo -e "\nsource /usr/bin/currento" >> $HOME/.bashrc
    fi
}
