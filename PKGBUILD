# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=openttd-ttdwin
pkgver=1
pkgrel=3
pkgdesc="Non-free TTD Windows data set for OpenTTD"
arch=('any')
url="http://www.chrissawyergames.com/"
license=("unknown")

# The TTD data files are protected by copyright
# and not included in source package.
# Please obtain them legally: http://www.transporttycoon.net/where
source=(gm_tt00.gm gm_tt01.gm gm_tt02.gm gm_tt03.gm gm_tt04.gm
        gm_tt05.gm gm_tt06.gm gm_tt07.gm gm_tt08.gm gm_tt09.gm
        gm_tt10.gm gm_tt11.gm gm_tt12.gm gm_tt13.gm gm_tt14.gm
        gm_tt15.gm gm_tt16.gm gm_tt17.gm gm_tt18.gm gm_tt19.gm
        gm_tt20.gm gm_tt21.gm sample.cat trg1r.grf trgcr.grf
        trghr.grf trgir.grf trgtr.grf)
md5sums=('45cfec1b9d8c7a0ad45e755833cbf221' 'ab14ed3392d848abd2a2e90a9d75d121'
         'dd4f696e4be5987ce738257b08b50171' 'a1bfde23343df9e4063419bf29c166b8'
         '4e6943aa0c455203d76c79389054747d' 'cee281cb85a2e2343552d97640545a47'
         '26d1de5efa8675f94065784e9d539e49' '6f2691e17558f552ec4c565e4ab7139c'
         'a42bf2cb3340a822f1a69646fc7a487d' 'eb35761a58a8df3c59ed8929cce13916'
         '42fecd686720a785d20a78590c466a82' '50ef1ef02e49d2112786dd45e69dc3ee'
         '4ce707a0e0e72419f0681dd9bd95271b' 'e765753be29d889ec818f38009103619'
         '270e2d63bd32b95a4d007ce15a6ce45f' '89e116a1c0c69f1845cc903a9bfbe460'
         'f824e2371b3bedfe61aad4b9c62dd6be' '1b23eebb0796c1ab99cd97fa7082cf7b'
         '15650de3bad645d0e88c4f5c7a2df92a' '7aec079e15bd09588660b85545ac4dfc'
         '1509097889dee617aa1e9a1738a5a930' 'a8d0aaad02e1a762d8d54cf81da56bab'
         '9212e81e72badd4bbe1eaeae66458e10' 'b04ce593d8c5016e07473a743d7d3358'
         '3668f410c761a050b5e7095a2b14879b' '06bf2b7a31766f048baac2ebe43457b1'
         '0c2484ff6be49fc63a83be6ab5c38f32' 'de53650517fe661ceaa3138c6edb0eb8')

build() {
    cd "$srcdir"

    mkdir -p "$pkgdir/usr/share/openttd/data"
    install -m644 trg{1,c,h,i,t}r.grf sample.cat \
      "$pkgdir/usr/share/openttd/data/" || return 1

    mkdir -p "$pkgdir/usr/share/openttd/gm"
    install -m644 gm_tt{00..21}.gm \
      "$pkgdir/usr/share/openttd/gm/" || return 1
}
