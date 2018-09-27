# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-2018-bin
pkgver=2018.936
pkgrel=1
pkgdesc="Softmaker Office 2018, proprietary office suite; word processing, spreadsheets, presentations"
url="http://softmaker.com"
arch=('x86_64' 'i686')
license=('custom')
depends=('hicolor-icon-theme' 'shared-mime-info' 'libxmu' 'libidn-133-compat' 'libgl' 'libxrandr' 'libxrender'
         'libx11' 'libxext' 'libxmu' 'curl' 'desktop-file-utils')
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
md5sums=('61a119bf8807977035f28cda48a3e638'
         '81d32048481bab4cf009f86742a8793a'
         '0865b2e62d78b655c82c4e07624a06bd'
         'b18a7751649f423d4e5e21dadcd83d49'
         '3c7d81e64333e7ab15676f08886736ee'
         '494d6d84e3855303c86a93d57bc95788'
         '91a0c79955c9157a195b68295a4cd904'
         'c6d665d62251154b53598482035abf86')
md5sums_x86_64=('a3d73bb3b61ecc238d07df7aec0567f6')
md5sums_i686=('d7a75122da58a1fa69108d3ccfcaf739')
sha512sums=('21ac47ca4327abc2cb819b8fc343e7abc8f8d95bc3a88b6745277c1a25045a5ccf420308a08964c199ed341ebd48349781ff5606c538d951aab7634ff3e30d5c'
            '6ba3e74e08af16d5d150fecb6c97c986a94f00e1810a719328e8938981a3af1a6632a0957490bd0dfc41fc787322e047b655db6c6e0187cfe9ecdc1dcd90deac'
            '2ce75892fad29d056537c69e4920093ce615178cc35b47e0492dfda8718ebbc97c4ca027624e1e0d90ec368769da0c56ba1e593c49cebde8c82a8275ce7acf47'
            '1dd786250853f8241020655a766b08a371671eba3381c231569ae9a9a3b0ded838a817ebc50a4fc21588abf9e722b83a9eaab2851fc036fa4478f977d826408c'
            'ee5021d7625682233ddb4ca21251dda6d01e50354ee0df9fdae93ab09f1a70fdd6f216dd9c0555d8780c628014acbaae6a5f185444e45852bf977c9d73c22f7d'
            'c09f7d80c7be33b26c384a18514ddc6f9c9d1b2669037a5921212a1d2b3b316a12524d458872446e1a850f87bec4af4e14d99967713d07d5dd7425b658b900f6'
            '8dcf3caa7273cb3f9f3b8ce08251db420c39b42be2a339d561771e913fae1dda55820403a1f7cd883aa1d361693c1a67fac44f92542872f5f186f66dd1fa45e4'
            'a1050b67e357312286eb87a3aa1b2a25a6edc3c1150871cb3d233152f601a2239c84315309111a496d8f056b4c600f9dee03e0b511e69126093255e971073986')
sha512sums_x86_64=('e580751c61d568003172c9dab7d4ba72be18b33eb029114b2d09db941cd75cffd23b094bd12853ba54d957f10a4091ad80cfa37fa0251616ea5755f73bf77225')
sha512sums_i686=('60eba0fe280f6293596a84771e13ce16629a2b68bbc6cac618c99cd192bf0d201ed813d29b61b59794dddbf5b9fabdffd8a7d333bccf4bb804033eb490d79a5d')

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
    ln -s "/usr/share/smoffice2018/icons/pmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd18-mso.png"
    ln -s "/usr/share/smoffice2018/icons/prd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd18-mso.png"
    ln -s "/usr/share/smoffice2018/icons/tmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd18-mso.png"
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
