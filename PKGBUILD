pkgname=isleward
pkgver=0.23.0.2
pkgrel=1
pkgdesc="The moddable, multiplayer roguelike."
arch=('i686' 'x86_64')
url="https://gitlab.com/Isleward/isleward"
license=('custom')
depends=(npm)
source=(https://gitlab.com/Isleward/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
b2sums=('95fb0bcef35d5f912bacaf8a0fd8b4445976c52cb26fd6dfc38e7585b3d044ac93c6f46e93a9020d7a64d02c6043e7f13390da47d6175629563be9145a100aa8')


build (){
   cd ${pkgname}-v${pkgver}/src/server/
   npm install
}


package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -dpr --no-preserve=ownership ${pkgname}-v${pkgver}/src/server/* "${pkgdir}/opt/${pkgname}/"
}
