# Maintainer: bilabila <bilabila@qq.com>
_name=轻淘客
_url=$(curl -w "%{url_effective}" -ILsS http://www.qingtaoke.com/jump/guge -o /dev/null 2>/dev/null|sed 's/ /%20/g')
_ver=$(sed 's/.*v\(\([0-9]\|\.\)\+\).*/\1/;s/\.//g'<<<$_url)
pkgname=qingtaoke
pkgver=r20$_ver
pkgrel=1
pkgdesc=轻淘客插件
arch=(x86_64)
url=http://www.qingtaoke.com
provides=($pkgname $_name)
conflicts=($pkgname $_name)
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
