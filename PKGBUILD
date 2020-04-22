# Maintainer: Yacob Zitouni <yacob.zitouni at gmail dot com>

pkgname=tso-version-patcher-bin
pkgbase=tso-version-patcher
pkgver=1.0
pkgrel=3
pkgdesc=".NET Core filesystem patcher based off of BsDiff. For patching TSO v1.1239.1.0 back to N&I, but can be used for anything."
arch=("x86_64")
url="https://github.com/riperiperi/TSO-Version-Patcher"
license=("MPL2")
depends=("mono")
provides=("tso-version-patcher")
source=("https://github.com/riperiperi/TSO-Version-Patcher/releases/download/v$pkgver/Release.zip"
        "tso-version-patcher.sh")
md5sums=('0815e2bef5942cfee82d41577a71250c'
         '68c6ad329dbf62e69196c0bb7f0ec919')

package() {
    install -d "$pkgdir"/usr/lib/tso-version-patcher
    install -d "$pkgdir"/usr/share/tso-version-patcher
    install -Dm755 bz2* "$pkgdir"/usr/lib/tso-version-patcher
    install -m755 deltaq.dll "$pkgdir"/usr/lib/tso-version-patcher
    install -m755 TSOVersionPatcherF* "$pkgdir"/usr/lib/tso-version-patcher
    install -Dm644 1239toNI.tsop "$pkgdir"/usr/share/tso-version-patcher
    install -Dm755 tso-version-patcher.sh "$pkgdir"/usr/bin/tso-version-patcher
}

