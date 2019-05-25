# Maintainer: degreeme <suratovvlad@gmail.com>
# Contributor: Van-ess0 <van-ess0@mail.ru>
# Contributor: Marcin Mielniczuk <marmistrz.dev at zoho dot eu>

pkgname=sailfishos-sdk-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="SailfishOS SDK is a collection of tools for developing SailfishOS applications."
arch=('x86_64')
url="https://sailfishos.org/"
license=('custom')
depends=('virtualbox')
conflicts=('sailfishos-sdk-beta-bin')
install=${pkgname}.install
options=(!strip)
source=("http://releases.sailfishos.org/sdk/installers/2.1.1/SailfishSDK-2.1.1-linux64-offline.run"
        "install_rules.js"
        "${pkgname}.install"
        "SailfishOS.license"
        "LICENSE.PYTHON"
        "LICENSE.LGPL"
        "LGPL_EXCEPTION.TXT"
        "LICENSE.GPL2"
        "LICENSE.GPL3"
        "LICENSE.ICU")
sha512sums=('ac86161fda7a1299ae9d4956abbb6316838fe91c8296fd626004f27f77a6910488807f2a3bd1e430a7c672d03dbf26897f71cf2084e8e77e1c253867e47c7058'
            'bcf093c1f257b00deaab6113feb0060ea3a165c10617948993a56607b70629d599b0727647e46a1fb12ce89d7c2788b689dad2b4e7310216c61053babe6db476'
            '150621bc8f2665be8d25f8064f531bea5c06bfb9e87687e3fbf1bd7db6a866e1021346e871780c2c8f2b94f7168f82cbc2b83b7ddbebf9f7e1b0fb576ed7da2a'
            '2766706db83d406473b03dbece980363f9a20ba244d1a8d35a4968ea9eeeaad43c4482b4df33885794b42688af7234a40e678a08d6d2c5036e0a5bf275847735'
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
    install -Dm644 "SailfishSDK-${pkgver}-linux64-offline.run" "${pkgdir}/usr/share/${pkgname}/"    
    install -Dm644 "username.txt" "${pkgdir}/usr/share/${pkgname}/"

    install -Dm644 "SailfishOS.license" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.PYTHON" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.LGPL" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LGPL_EXCEPTION.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.GPL2" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.GPL3" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE.ICU" "${pkgdir}/usr/share/licenses/${pkgname}/"
}