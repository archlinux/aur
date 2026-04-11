# Maintainers: kobe-koto <k at koto dot cc>
# shellcheck disable=SC2034
declare pkgdir
declare srcdir

pkgname="liteloader-qqnt-patcher"
pkgver=0.0.3
pkgrel=1
pkgdesc="A patcher for LiteLoaderQQNT"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-patcher")
install=liteloader-qqnt-patcher.install

source=("LiteLoaderQQNT.js"
        "liteloader-qqnt-patcher.sh"
        "liteloader-qqnt-patcher-notify.hook"
        "liteloader-qqnt-patcher-patch.hook")
sha256sums=('07739e1313a47ba3fa22d30ecf295afe1603cc8401d370fe22aa8dfc8da8c0c7'
            '0de5d058c5fcbccd587e5f20471f9864a731fb7716408529cb2f5779ca1296c8'
            '43047c31ad3cccb42cfc54705d1ffcdc93aaff4ef12bc8998836f329fa187ceb'
            'ac9278718f9c2442e8a628975accf42475eb9eef24c1cfa42a321ea8fa75c170')

package() {
    install -Dm755 "${srcdir}/liteloader-qqnt-patcher.sh" -T "${pkgdir}/usr/bin/liteloader-qqnt-patcher"
    
    install -Dm755 "${srcdir}/LiteLoaderQQNT.js" -t "${pkgdir}/opt/QQ/resources/app/app_launcher/"

    # ALPM hooks
    install -Dm644 "${srcdir}/liteloader-qqnt-patcher-notify.hook" -t "${pkgdir}/usr/lib/liteloader-qqnt-patcher/libalpm-hooks/"
    install -Dm644 "${srcdir}/liteloader-qqnt-patcher-patch.hook" -t "${pkgdir}/usr/lib/liteloader-qqnt-patcher/libalpm-hooks/"
}
