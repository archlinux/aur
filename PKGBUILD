# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hook to automatically detect which packages need to be rebuilt"
arch=("any")
license=("MIT")
install=rebuild-detector.install
source=("rebuild-detector"
        "rebuild-detector.sig"
        "rebuild-detector.hook"
        "rebuild-detector.hook.sig"
        "rebuild-detector-cleanup"
        "rebuild-detector-cleanup.sig"
        "rebuild-detector-cleanup.hook"
        "rebuild-detector-cleanup.hook.sig")
sha256sums=('c77f55f6d84a9754e744a547fd64ee1b15906fb45afd127613dddc41a9760547'
            'SKIP'
            '85117be08f7c904805de0b58722532caa55dfc2cb31f118d509871f3d40b96ec'
            'SKIP'
            '9d5be08cd837a4e6445b1880119896f82596be2bd53cf24b525abab3b90079d0'
            'SKIP'
            '5609c9c0812412cee629964eec692e989524d476f69c5125fa1cb846ff5be7e2'
            'SKIP')
validpgpkeys=("EB4F9E5A60D32232BB52150C12C87A28FEAC6B20")

package() {
    install -Dm755 rebuild-detector -t "$pkgdir/usr/share/libalpm/scripts/"
    install -Dm755 rebuild-detector-cleanup -t "$pkgdir/usr/share/libalpm/scripts/"
    install -Dm644 rebuild-detector.hook -t "$pkgdir/usr/share/libalpm/hooks/"
    install -Dm644 rebuild-detector-cleanup.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}

# vim:set ts=4 sw=4 et:
