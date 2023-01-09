# Maintainer: André Kugland <kugland at gmail dot com>
# Prev. maintainer: GordonGR <ntheo1979 at gmail dot com>
# Prev. contributor: Angel Sartonev <a.sartonev at gmail dot com>

pkgname=otf-gfs-majuscule
pkgver=20181103
pkgrel=4
pkgdesc='Open Font Majuscule typefaces, provided by the Greek Font Society'
arch=(any)
url='http://www.greekfontsociety-gfs.gr/typefaces/majuscule'
license=('OFL')
source=("http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Ignacio.zip"
        "http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Garaldus.zip"
        "http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Jackson.zip"
        "http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Nicefore.zip"
        "http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Eustace.zip"
        "http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Fleischman.zip"
        "http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Ambrosia.zip")

sha512sums=('1195534ba5007e0fc28ff45a374925f471dd89e0b66cf7720a015ea6ed655dd61e8ed38ce984e3013f9abb3da7786ae32c8fcb59a3bc007fd3f3b9fd6f58e871'
            'fdc4f49d85f20d46b23af79036940726a02674503425d0d11c88cd14ed87b54ff24c75e321a5439247362a55350ca28fb5b6ec03ad31a41ef5abca6c23a4e42b'
            '0b0e18b25418b79968201ffc1ba069d009f923d08c3a55ed5d80fdd7071be1343574b61d0eedcae88db9941523dd4c818cd1b458934d8acfbab602035fca54e5'
            '6610494bc6dd41f19f606b999e08fa0a7f9a31f0fdf2ea753929580e8ae8e002528632a467595fc5a92eb0b8de93cb26fd0e7bd3cc80c6d8a72648ef6cba7f47'
            '1054a61e29c464b5891959de4c19326a770c266d007707d73c9a77e1d86335bcda6052fbf4b627e8c2ac3d636ecadc688f26a814f6ac25a2a78fb8f25150f046'
            '47dcf29acd7b40ffae3785782d379d09cdc13250125811df29ce39c0415bb9fdec3a6bf863ceeb15b7ae67505ba01bb392d73059fc7b3739d3acf06cd3387575'
            '032c445fa32af9858117dd7e144412d70e8eb813a00982b4727fd792bfcc64822ce1c534c4c6c5fc2e2390d2f518de497b33cdb7dce262885810ff4e328bd764')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/$pkgname/"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    for font in Ambrosia Eustace Fleischman Garaldus Ignacio Jackson Nicefore; do
        find . -iwholename "./GFS_${font}/GFS*${font}.otf" \
               -exec install -Dm644 '{}' "$pkgdir/usr/share/fonts/$pkgname/" ';'
        find . -iwholename "./GFS_${font}/OFL.txt" \
               -exec install '{}' "$pkgdir/usr/share/licenses/$pkgname/OFL-GFS_${font}.txt" ';'
    done
}
