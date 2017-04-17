# Maintainer: degreeme <suratovvlad@gmail.com>
# Contributor: Van-ess0 <van-ess0@mail.ru>

pkgname=sailfishos-sdk-beta-bin
pkgver=1701
pkgrel=2
pkgdesc="SailfishOS SDK is a collection of tools for developing SailfishOS applications. Early Access SDK."
arch=('x86_64')
url="https://sailfishos.org/"
license=('custom')
depends=('virtualbox')
conflicts=('sailfishos-sdk-bin')
install=${pkgname}.install
options=(!strip)
source=("http://releases.sailfishos.org/sdk/installers/1701-1/SailfishOSSDK-Beta-1701-1-Qt5-linux-64-offline.run"
        "install_rules.js"
        "${pkgname}.install"
        "SailfishOS.license"
        "LICENSE.PYTHON"
        "LICENSE.LGPL"
        "LGPL_EXCEPTION.TXT"
        "LICENSE.GPL2"
        "LICENSE.GPL3"
        "LICENSE.ICU")
sha512sums=('69f958fc2edb799de8aadcd43acb7b5a7429a5f2d82051766dfe93f4742cffa8315657d8509e96dee818e9cafd9626c6698b66fc43662080a9978e5325abc0a6'
            '6a2d9e183dfba9bc23379ec2b1edef54770cd0a896acf8179611da049beb4f59d408c266ac511b9cd8c7be5f186536712142a8e1b2bb32baa455d8b1d8b36589'
            'e11ba94f8a0ecfc2de4e017a9905b381688897e8e33dd0c12cf92cb91a0e0f5293c9069ebd3a8473c29a67806db750f0545bbc79815d1d2daf3e5043dadfbe2a'
            '18f198773d1d4952dac10602081a2c4232e6d186ba54866ce6507622790a85aa4792b3666105a8cad1ceedfdd95f225dbe3c93542b8960613782a4ae061a2c55'
            'c4f1c7e8b53df02e1bb85c51e76d30ad25a4b01f08afb14d2060bd9c4b4a78b339440fd4b5dcb11d6a813a0a64f034bc4bbfd9a94d351530e606ce9c62920ca4'
            '0b0d49a2479a2e051538421a74e6f04f07ffe320e04f97e539f209d00703978d77b097a9e857deb8f40022875fb1f23b1fecd96fa73fcd714e0eae29c7d58f05'
            '0a9a41d96234627b5a51627046c2c984b4ac4bbc9825288a49924ce0e8c0bf26305004edf3e78ead17678fab324c54bc09a0e076657c03f20ab886163ec0b949'
            '6c628be3fa80568200c2d1979349d16ea5575d7017c2d41f71f29703e65452b00d0d0033bf87a3e4d3ef23d28b80b31a082c0c98110ec56a647bde3ce3c269a7'
            'a1fad48f360be0bfb339f2a4bbfaa042fc73d31073e1b18ec558eb384980bd64e4fae2ba7f02199da03f634814f8e7e37dd41ededdbcba9ea0aed6f1f084f4d7'
            '5178a2f4b8bec7ba55bdd76ed4a0839fb073749e536e79cf1bb23de1ce27dfc838ea4a580921ac6e95a3d2f45862ddbcc229194836c473fe2734bf071ed0ef07')
PKGEXT='.pkg.tar' # Prevent compressing of the final package

prepare() {
    echo "You should be sure in free space (900 MB in /usr/share and 6GB in /opt)"

    whoami > username.txt
    cat username.txt
}

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    
    install -Dm644 "install_rules.js" "${pkgdir}/usr/share/${pkgname}/"
    install -Dm644 "SailfishOSSDK-Beta-1701-1-Qt5-linux-64-offline.run" "${pkgdir}/usr/share/${pkgname}/"    
    install -Dm644 "username.txt" "${pkgdir}/usr/share/${pkgname}/"

    install -Dm644 "SailfishOS.license" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.PYTHON" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.LGPL" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LGPL_EXCEPTION.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.GPL2" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.GPL3" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.ICU" "${pkgdir}/usr/share/licenses/${pkgname}/"
}