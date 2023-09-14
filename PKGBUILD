pkgname=mybase8
pkgver=8214
pkgrel=1
pkgdesc='A high-quality free-form database program for personal note-taking and knowledgebase management'
arch=('x86_64')
url='http://www.wjjsoft.com'
license=()
depends=()
provides=('mybase8')
conflicts=('mybase8')
source=(
  "http://www.wjjsoft.com/downloads/Mybase-Desktop-Ver${pkgver}-Linux-amd64.tar.xz"
  "Mybase8.desktop"
)
sha512sums=(
  '765531cf1237a0ea9d998fffbde17996ba02017e4a7cf3b98dfbea39c9955acd9a92fdf5dff40c94897ffd08d93e9620c6806dcd80a63d9759873c0d499ecc5b'
  'a4542cf49be5674db56cc9fd44a26ed2205feec9847d474ff8679a813105c7d00cc8546a0e63f379d8a83ef6140df7c797fc4e0a5977dcba574b6edc053f39df'
)

#prepare() {
#  tar -xf Mybase-Desktop-Ver${pkgver}-Linux-amd64.tar.xz
#  rm myBase8/install.sh
#}

package() {
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons" 
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"

    cp -r "${srcdir}/Mybase8" "${pkgdir}/opt/"
    install -m644 "${srcdir}/Mybase8/nyf8_logo_256.png" "${pkgdir}/usr/share/icons/Mybase8.png"
    install -m644 "${srcdir}/Mybase8.desktop" "${pkgdir}/usr/share/applications/Mybase8.desktop"
    ln -s /opt/MyBase8/Mybase.run "${pkgdir}/usr/bin/Mybase8"
}
