# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgbaseU='Zenbones'
_type='TTF'
pkgbase="ttf-zenbones"
pkgname="ttf-zenbones"
pkgver=2.400
pkgrel=1
extraver=
pkgdesc='A custom Iosevka build drawing inspirations from various programming typefaces.'
arch=('any')
url='https://michaelchris.space/zenbones-mono'
license=('OFL-1.1')


#https://github.com/zenbones-theme/zenbones-mono/releases/download/v2.400/Zenbones-Proto-TTF.zip

source=("${_type}-${_pkgbaseU}-Proto-${pkgver}.zip::https://github.com/zenbones-theme/zenbones-mono/releases/download/v${pkgver}/${_pkgbaseU}-Proto-${_type}.zip"
        "${_type}-${_pkgbaseU}-Mono-${pkgver}.zip::https://github.com/zenbones-theme/zenbones-mono/releases/download/v${pkgver}/${_pkgbaseU}-Mono-${_type}.zip"
        "${_type}-${_pkgbaseU}-Prose-${pkgver}.zip::https://github.com/zenbones-theme/zenbones-mono/releases/download/v${pkgver}/${_pkgbaseU}-Prose-${_type}.zip"
        "${_type}-${_pkgbaseU}-Brainy-${pkgver}.zip::https://github.com/zenbones-theme/zenbones-mono/releases/download/v${pkgver}/${_pkgbaseU}-Brainy-${_type}.zip"
        "${_type}-${_pkgbaseU}-Slab-${pkgver}.zip::https://github.com/zenbones-theme/zenbones-mono/releases/download/v${pkgver}/${_pkgbaseU}-Slab-${_type}.zip"
        "LICENSE.md::https://raw.githubusercontent.com/zenbones-theme/zenbones-mono/refs/tags/v${pkgver}/LICENSE.md")
noextract=("LICENSE.md::https://raw.githubusercontent.com/zenbones-theme/zenbones-mono/refs/tags/v${pkgver}/LICENSE.md")

b2sums=('e3250b8809e51094f07f5a68b1af896c5edae36f0136f9cdd1d172daba2a33b7d5eae6423baea206682a1e6f8887c45f5e6dfd8d73a6b15e3763a545a4d34435'
        'afd4563d2392931ea15c3df80dbbd381ecb1035fad997a4969dd0527db34e10430a86c3dfa14c6e03a340e675f957dcbbcd4180d8add3c6daf1cff3a7ab979cc'
        '182a93bd9b3dd3f114e26c6937158748b7b39debfaaa6ffa751178a3ca90d62bd7abd62964cec73a7b9d62151b5bd1acc35d5c3315405f674de2992dfec75433'
        '673be6f5f1ed5a4e239b98d91b2e3a435ed177c4a27319b3a646d47b06ad5e74aec6f987dc46530defda36a5816793f9682a9929496195c663067f4e2701921c'
        'da3885f4420291231acf9a4981dedf398fd59e1aa37aeb212ef3895dfcf2f8c6bc6860c9ddcdaf954541d56cf8e6bff566e2bc973e91bce5141a66a637b04c49'
        'c4444257db2f679583e9d904adbceab8f0d4d5ba6c7b8da430529683da919ee817ae29ab94ce35e62ea30a514700709ea9caffb9df432fec8103da14fa466e7b')

# depends=('fontconfig')
provides=(${pkgname})
replaces=(${pkgname})

# install=${_pkgbase}.install

function package() {
    cd "${srcdir}/"
    install -d ${pkgdir}/usr/share/fonts/TTF/${_pkgbaseU}
    rm -rf "${pkgdir}/usr/share/fonts/TTF/${_pkgbaseU}"/*
    install -m644 "TTF/${_pkgbaseU}"*.ttf "${pkgdir}"/usr/share/fonts/TTF/${_pkgbaseU}/
    rm -rf "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE.md
    install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
