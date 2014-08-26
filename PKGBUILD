# $Id: PKGBUILD 112863 2014-06-09 09:56:33Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>

# chinese requires two files
_langs=(afr ara aze bel ben bul cat ces chi_sim chi_tra chr dan deu ell
eng enm epo epo_alt equ est eus fin fra frk frm glg grc heb hin hrv hun
ind isl ita ita_old jpn kan kor lav lit mal mkd mlt msa nld nor pol por
ron rus slk slv spa spa_old sqi srp swa swe tam tel tgl tha tur ukr vie)

pkgbase=tesseract-data
pkgname=($(for l in ${_langs[@]}; do echo tesseract-data-${l}; done))
pkgver=3.02.02
_pkgver=3.02
pkgrel=5
pkgdesc="An OCR programm"
arch=(any)
url="http://code.google.com/p/tesseract-ocr"
license=("APACHE")
depends=()
source=($(for l in ${_langs[@]}; do
        echo http://tesseract-ocr.googlecode.com/files/tesseract-ocr-${_pkgver}.${l}.tar.gz
        done))
md5sums=('16a756bf353896e34386f4509582e487'
         'd7b3708f1f1f2898c258209923063f57'
         '143044ff7b643b844c2f0b2a170ceda2'
         '3bb6dab515166d641ac62e973c868ac5'
         '0b662630eb4b2e0ebf40c38184068fba'
         '91fc34ef041aafe32549a7a6232afad0'
         '27b77ecc66f8c8d904cd6b87886aca22'
         'ae144b9d230267b5ae62804ad7a09dac'
         '718779539d3202ae95ae5ff52a3ad5e8'
         '391ed3fcf014bae777b33dc7a771a00d'
         'dd5b4fa247500d7713ab5556af62d9fa'
         '2f6a93920b3ce55de24ca762a66a5de1'
         '57bdb26ec7c767e126ff97776d8bfb10'
         '3760cc3dee6489dcc865b31e7a36bd47'
         '3562250fe6f4e76229a329166b8ae853'
         'd9dc4ad9cbcde78e5be59eb226865661'
         '5dc0cf01d21ee43ed834ee947e1e810a'
         '67815529386679223092ddf301bf57d4'
         '94667836c651fc4fd43645efdc34e19a'
         'a067f5975cbe83fea205897187fa256b'
         '4c2cee5bf3558f6384e5907aa02ae80c'
         '71f8b343ed2010f775ff474faec5874f'
         '2bca200b783fdba2f546063c68740c50'
         'dd734ac212a98a02945760891b657e70'
         'e0ca24ca45de83e67057f0e208233ffc'
         'ef7b8e13891e08f29b02011a5dd6b630'
         'ac493e5a49e456f2dd354f5b6449573e'
         '7ae7f3384083c66f06d63b6c0f0a66c3'
         '186f17b326a58313344c2ea987ea7785'
         '0396a267d894f485b6b534476f3322dc'
         'eb1b3537cd664fec48bebac75fac5992'
         '9f672ea7c90eecbbe35ec353ff45c764'
         '3f05946a9e57a8ffabb3fccc8a80cfaa'
         'fbdba86f34b907f5a709051c01b53f71'
         '989ca558eb05fcf6873dfdd8c692291d'
         'e1be2b08e667c3bb0ab0f18c9456bf2f'
         '510016e85d7ea8e1f4ebf98741138909'
         'fc9125f6652fb661575d6e15c94f88f6'
         '2095b56c9c6b0dba9b837fd226ed6d29'
         '801021a1ad6e4aa3ef697f065ff6c798'
         '1f5e8f022d3c2697075bdfc03935f128'
         'b8930c64befcaadbb47951cad4a2f075'
         '90a41ac86375b230980b643b35b88011'
         'cb42ec9504eecdc4f974dbca4387ac34'
         '6db5753b3b03296544bbb2c0f59a7178'
         '6d979585abb07c13dda003820129461c'
         '90b3f1f4113a9dccd0287e6b5b7512d6'
         'ad490a8091ee329190266f3fd057c511'
         '9f498e01855a57473af8f083c125455a'
         'e8c785df8aaa49e61f3a95aa24066122'
         '991e4771e16abd6a66caeaeeb2a4d4d2'
         'c7bea975ba663d13e03c29d6cf33b5a8'
         'fe1385ed203ecd9e0999a44b135069ec'
         '7838da948e404bb760bef83a5c3d64dd'
         '372e38617fcc7e25c77996c5499ae063'
         'd8350668fa790b5d4007348a55840bdf'
         '6c68107a71f82fa42c858e4d6dc70aca'
         '46d3a5d7159236edb33272dd8b1090f6'
         'c68b0fdcdf34dd431c25f323673ef1d6'
         '349d203ef88864eab8d1201672ca84be'
         'd458f0719b99e4dcfd4fa2a06e5150a3'
         '3dc5a5028e75da12eaba62669a80acc4'
         'a8934e0e6496997112cbef2961adef5e'
         '0aa61f18463bb89234a6d06fcbf0c644'
         '78a74432848b4c53cc2ccf2eb339c0b6')

build() {
  true
}

# Declare the package functions for data
for l in ${_langs[@]}; do
    eval "
package_tesseract-data-${l}(){
    pkgdesc=\"Tesseract OCR data ($l)\"
    depends=('tesseract')
    groups=('tesseract-data')

    mkdir -p \$pkgdir/usr/share/tessdata
    cp \$srcdir/tesseract-ocr/tessdata/${l}.* \$pkgdir/usr/share/tessdata/
    find \$pkgdir/usr/share/tessdata -type f -exec chmod 0644 {} \;
}
    "
done
