# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-2018-bin
pkgver=2018.924
pkgrel=1
pkgdesc="Softmaker Office 2018, proprietary office suite; word processing, spreadsheets, presentations"
url="http://softmaker.com"
arch=('x86_64' 'i686')
license=('custom')
depends=('hicolor-icon-theme' 'shared-mime-info' 'libxmu' 'libidn' 'libgl' 'libxrandr' 'libxrender'
         'libx11' 'libxext' 'libxmu')
source=('planmaker-2018.desktop'
        'presentations-2018.desktop'
        'textmaker-2018.desktop'
        'planmaker18'
        'presentations18'
        'textmaker18'
        'softmaker-office-2018.xml'
        'license-scope.txt')
source_i686=("http://www.softmaker.net/down/softmaker-office-${pkgver//./-}-i386.tgz")
source_x86_64=("http://www.softmaker.net/down/softmaker-office-${pkgver//./-}-amd64.tgz")
md5sums=('7afe83509fe2e5455fb5c832544a1a5e'
         '545bcdff67bf80266df46fd1ff943b5c'
         '2bac7ffc31d59c5997f1ba8151b34671'
         'b18a7751649f423d4e5e21dadcd83d49'
         '3c7d81e64333e7ab15676f08886736ee'
         '494d6d84e3855303c86a93d57bc95788'
         '9e2fe397368fff4297f28338dd09f142'
         '610683571939cde2d2223c2717259b78')
md5sums_x86_64=('62ea8bb0095575731bd194446e7f8003')
md5sums_i686=('3fff2d25c35e11b944fc2c945c79bc66')
sha512sums=('267a49d68130d5c5fed4319de91972d7b71510a0c090be3343965997bb6554dcc197405d6272971195d2b5df9ec270c9b620820cb2ea1bff35eeef0d013f1d97'
            '5cc874d89f36a570d8ed93d86034649c63f52ac429dfc69db8e9fe89ade32023ec64ab1e17dfa1b67a60e90ad5c82d1ee7007f09682273de5f8aa7abc0d53e9b'
            '17971aed65cd1432e3ed361c6fb4c150e52bc2a7fa17505ceedbbae190e2dba87d7ab4233edda4e0841b2ab2d1912bfddca70e9bf3b699803e72573d8f5b8f25'
            '1dd786250853f8241020655a766b08a371671eba3381c231569ae9a9a3b0ded838a817ebc50a4fc21588abf9e722b83a9eaab2851fc036fa4478f977d826408c'
            'ee5021d7625682233ddb4ca21251dda6d01e50354ee0df9fdae93ab09f1a70fdd6f216dd9c0555d8780c628014acbaae6a5f185444e45852bf977c9d73c22f7d'
            'c09f7d80c7be33b26c384a18514ddc6f9c9d1b2669037a5921212a1d2b3b316a12524d458872446e1a850f87bec4af4e14d99967713d07d5dd7425b658b900f6'
            '02528e698373bd36f5bfe4671f75fc6a7f995e297f6069a838b8b66b0d9b840724548dfe15549b0216e34ee59e74a869ee6504890347bb035f2a1cd0fc91d9ac'
            '4dc5f414c45b25647a204d93ad8819fa35684e48e53eeeecbb8189d7a89976f8ac303c6b7097af324f93c61ba6d43ec3cb389a47ae9b2e0f45442e8cd79e9ba7')
sha512sums_x86_64=('91b6bbfa0b60648296203c30a4dce8897acb351244368c923dfce19f23e2c0525f70ff95f0c247ac942e427cb28cf31ea5e34e7385263e9b5baafa7d6d435672')
sha512sums_i686=('5b0bae97170a9318f0e34852a26023f46d7caa1060322cfbb3e718db7014d6d2845ffe978185d364b07d456267a801c66ce660072e74b5dce0fdf966f580385c')

package() {
  install -dm755 "${pkgdir}/usr/share/smoffice2018"
  bsdtar xf "${srcdir}/office2018.tar.lzma" -C "${pkgdir}/usr/share/smoffice2018"

  install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/planmaker18" "${srcdir}/presentations18" "${srcdir}/textmaker18"
  for size in 16 32 48 64 128 256 512; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -s "/usr/share/smoffice2018/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2018-planmaker.png"
    ln -s "/usr/share/smoffice2018/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2018-presentations.png"
    ln -s "/usr/share/smoffice2018/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2018-textmaker.png"

    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -s "/usr/share/smoffice2018/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd18.png"
    ln -s "/usr/share/smoffice2018/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd18.png"
    ln -s "/usr/share/smoffice2018/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd18.png"
    ln -s "/usr/share/smoffice2018/icons/pmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd18-oth.png"
    ln -s "/usr/share/smoffice2018/icons/tmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd18-oth.png"
  done

  install -Dm644 "${srcdir}/softmaker-office-2018.xml" "${pkgdir}/usr/share/mime/packages/softmaker-office-2018.xml"
  install -dm755 "${pkgdir}/usr/share/mime-info"
  ln -s /usr/share/smoffice2018/mime/softmaker-office-2018.mime "${pkgdir}/usr/share/mime-info/softmaker-office-2018.mime"

  install -Dm644 "${srcdir}/planmaker-2018.desktop" "${pkgdir}/usr/share/applications/planmaker-2018.desktop"
  install -Dm644 "${srcdir}/presentations-2018.desktop" "${pkgdir}/usr/share/applications/presentations-2018.desktop"
  install -Dm644 "${srcdir}/textmaker-2018.desktop" "${pkgdir}/usr/share/applications/textmaker-2018.desktop"

  install -Dm644 "${srcdir}/license-scope.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-scope.txt"
  install -Dm644 "${pkgdir}/usr/share/smoffice2018/mime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
