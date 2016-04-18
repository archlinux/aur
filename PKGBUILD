# Maintainer: Sukbeom Kim <sukbeom.kim@gmail.com>
pkgname=shell_shortcut
pkgver=0.1
pkgrel=3
pkgdesc="Simple script to use shortcuts in terminal environment."
arch=('any')
url="https://github.com/seokbeomKim/shell_shortcut"
license=('GPL')
depends=('')
source=("git://github.com/seokbeomKim/shell_shortcut")
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    cp bin_shortcut{,.bak}

    sed -i bin_shortcut.bak -e 's/\(CONFIG_FILE=\)\(.*\)/\1\/usr\/local\/etc\/config_shortcut/g' bin_shortcut
    sed -i bin_shortcut.bak -e 's/\(PATH_FILE=\)\(.*\)/\1\/usr\/local\/etc\/path_shortcut/g' bin_shortcut
    
    install -Dm755 bin_shortcut ${pkgdir}/usr/local/bin/bin_shortcut
    install -Dm644 config_shortcut ${pkgdir}/usr/local/etc/config_shortcut
    install -Dm644 path_shortcut ${pkgdir}/usr/local/etc/path_shortcut
    
    echo "To run the script, type \'bin_shortcut -l\'. You can use it easily within alias. If you'd like to \
    get more information, please visit https://github.com/seokbeomKim/shell_shortcut";
}
