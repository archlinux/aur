# Maintainer: bilabila <bilabila@qq.com>
_url=http://www.qingtaoke.com/jump/chrome
_url=$(curl -w "%{url_effective}" -ILsS $_url -o /dev/null 2>/dev/null|sed 's/ /%20/g')
_ver=$(sed 's/.*%20\(\([0-9]\|\.\)\+\)\.zip/\1/'<<<$_url)
pkgname=qingtaoke
pkgver=$_ver
pkgrel=1
pkgdesc=轻淘客插件
arch=(x86_64)
url=http://www.qingtaoke.com
provides=($pkgname)
conflicts=($pkgname)
license=(custom)
source=($_url)
sha512sums=(SKIP)
install=$pkgname.install
package() {
    cd "$(dirname "$(find . -type f -name manifest.json)")"
    d="$pkgdir"/usr/share/$pkgname
    mkdir -p "$d"
    cp -r * "$d"
    find "$d" -type d -exec chmod 755 {} +
    find "$d" -type f -exec chmod 644 {} +
}
