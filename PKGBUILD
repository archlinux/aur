# Maintainer: Andreas Schliebitz <schliebitz dot andreas at gmail dot com>

pkgbase=stardog-studio
pkgname=stardog-studio-bin
pkgver=1.22.1
pkgrel=1
pkgdesc='IDE for the Stardog graph database management system.'
arch=('any')
url='https://www.stardog.com/studio/'
license=('unknown')
provides=('stardog-studio')
conflicts=('stardog-studio')
options=('!strip')

source=(
    "https://s3.amazonaws.com/studio.stardog.com/linux/Stardog%20Studio-${pkgver}.tar.gz"
    stardog-studio.desktop
    stardog-studio.png)
    
b2sums=('3429c18709291e827e7ae90be376006d50189ad77ddfb660a84591f9559ac578d50aef107470f69de337e5005d4150f71323ec8753a960ed4f49e46c08e4ed10'

'6d355359ea74002f7c6be304e163ac0d9904a50e6673be53f562b456cb62a0643cbe3d5498652b43dbebba123d1ca4feb560f46e3ba7959d7c751b259775217e'

'fd0c409793dd6cbdd1be39f2cea3c74c8cf086778163627cb23ffea30a23737fa4e24bfa5fceb4f30f392c0211b7cd644778518043efee5e4ffe71b7ec882366')

package() {
    install -dm755 "${pkgdir}"/opt/
    install -dm755 "${pkgdir}"/usr/bin/
    install -dm755 "${pkgdir}"/usr/share/applications/
    install -dm755 "${pkgdir}"/usr/share/pixmaps/
    
    cp -a "${srcdir}/Stardog Studio-${pkgver}/" "${pkgdir}"/opt/${pkgbase}

    ln -s /opt/${pkgbase}/${pkgbase} "${pkgdir}"/usr/bin/${pkgbase}
    install -m644 "${srcdir}"/${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
    install -m644 "${srcdir}"/${pkgbase}.png "${pkgdir}"/usr/share/pixmaps/${pkgbase}.png
}
