# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgbaseU='Zenbones'
_type='TTF'
pkgbase="ttf-zenbones"
pkgname="ttf-zenbones"
pkgver=2.500
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

b2sums=('5154903e6db0e0b6a29b1b2934a4e1730fccc782f8503d7aa776b6059e5833358f437c5d708bffd3717a9e3fa6306f35ee0e36a6f033423a82c63b87e84b6983'
        'ac39095df14767c6cb6d1b14f57cab964ffd339c6a898a376dca4862365bbc8bb9276985464d4c432805504790c8657f13271d6283c1ae3a71a9a8a27fee0346'
        '743fd0903e7daaa03410297f8e6ddfaeb46cf9012e09e10635221ba7adc12ee358577c175ad9446fcd3392bbf7b8cd7633bc68cce22058fc3a43c0f3914bca03'
        '7d874be6aae9e361e924c83cf979e15f121028b62d6f55eacd2e3d243982099cdba644a53ec5a7c294c62c05761ca13bdd391598374229b59e0e1235154008eb'
        'a8b085bc7290b3bb69e2a37c676a63944abbbe6ce2d87adcca08ec29861bf40e1cfec6714c36e1658583d67dfe2b2d0fd61d116b071801e1e7830864f8c2422c'
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
