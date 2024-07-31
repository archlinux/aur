# Maintainer: Tjw123hh <tjw123hh@outlook.com>

pkgname=noto-fonts-cjk-chws
pkgver=20240731
pkgrel=1
pkgdesc="Google Noto CJK fonts, with OpenType chws/vchw features added using [chws_tool](https://github.com/googlefonts/chws_tool)."
arch=("any")
url="https://github.com/tjw123hh/noto-cjk-chws"
license=("OFL-1.1")
conflicts=("noto-fonts-cjk")
provides=("noto-fonts-cjk")
source=("${pkgname}-${pkgver}-NotoSansCJK-Black.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Sans/OTC/NotoSansCJK-Black.ttc"
        "${pkgname}-${pkgver}-NotoSansCJK-Bold.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Sans/OTC/NotoSansCJK-Bold.ttc"
        "${pkgname}-${pkgver}-NotoSansCJK-DemiLight.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Sans/OTC/NotoSansCJK-DemiLight.ttc"
        "${pkgname}-${pkgver}-NotoSansCJK-Light.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Sans/OTC/NotoSansCJK-Light.ttc"
        "${pkgname}-${pkgver}-NotoSansCJK-Medium.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Sans/OTC/NotoSansCJK-Medium.ttc"
        "${pkgname}-${pkgver}-NotoSansCJK-Regular.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Sans/OTC/NotoSansCJK-Regular.ttc"
        "${pkgname}-${pkgver}-NotoSansCJK-Thin.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Sans/OTC/NotoSansCJK-Thin.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJK-Black.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Serif/OTC/NotoSerifCJK-Black.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJK-Bold.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Serif/OTC/NotoSerifCJK-Bold.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJK-ExtraLight.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Serif/OTC/NotoSerifCJK-ExtraLight.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJK-Light.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Serif/OTC/NotoSerifCJK-Light.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJK-Medium.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Serif/OTC/NotoSerifCJK-Medium.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJK-Regular.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Serif/OTC/NotoSerifCJK-Regular.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJK-SemiBold.ttc::https://github.com/tjw123hh/noto-cjk-chws/raw/main/Serif/OTC/NotoSerifCJK-SemiBold.ttc"
        LICENSE)
sha256sums=('699a6a7099409d5d274d2544fce0e9c5ccc348145da36f8d0b6fc29113b7e843'
            '139cd24d8f45e5e507e5fd1aa7070c330cfe4d5dc7647b9e3272c83819dd2e3c'
            '14a5dba8ca0143498cd79cbe691a30c40cede4bc8c1de999f8b3baf03c548cf4'
            'd5aa017d80ce2fb21f04e3ad5160000167397100c822b6e049740ffb0ab44543'
            '161129bb85f76584623aabac3f67cb675b8af09fc725bd336ae2eabc39fe9853'
            '0f44e63bf23ae5345ef375e1ec50a3668bce6c1095f795399c0bc2f3f0c5551b'
            '5cad385ce9ae71b1b349394ada7cf899062662feb0e595773f7aee14afee69f3'
            '55580bbe49336e0630d9b7685b0b76ff80b4e62d64a2b2dbcfa33460a45bfbb5'
            '696f038cf8158d47f686e3c25f1b1acd38c44d893113a7be0982a3e993250731'
            '14a6066e68c64b38388a5a93f869c457d88ac37d4088a4633568bef74d4b775f'
            'b35b1d882f5288b6ba48fb72c559c62186aca6e559324617b4f7056807478b18'
            'baabd72578a54764bc1012cf35b1d70a68be4190c2ed043f40d9d35a72eaac5a'
            '9a87cc34a61cc6074c6200c53ad530a24bd096cae361eb7a654f8af8358e753d'
            'e803ee054cd586a01a58dc83fe24b0cb63ef4bcb5ce51f242719ec0207badf58'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
package() {
  for file in ${pkgname}-${pkgver}-*.ttc; do
      new_filename=$(basename "$file" | sed "s/^${pkgname}-${pkgver}-//")
      install -Dm644 "$file" "$pkgdir"/usr/share/fonts/noto-cjk/$new_filename
  done
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
