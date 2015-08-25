# Maintainer: Lara Maia <lara@craft.net.br>
DLAGENTS=('http::/usr/bin/aria2c -j 1 -x 5 -k 2M --async-dns=false --referer="http://www.geeks3d.com/glslhacker/download/" -o %o %u')

pkgname=glslhacker-sample-pack
pkgdesc="GLSLHacker code sample pack"
url='http://www.geeks3d.com/glslhacker/'
license="custom"
pkgver=2.42.0
pkgrel=1
arch=('any');
source=('http://www.ozone3d.net/glslhacker/dl/GLSLHacker_CodeSamplePack.zip')
md5sums=('8a3b41f3029f4bf8cd15d4969a9b1079')
makedepends=('unzip')

package() {
    cd "GLSLHacker_CodeSamplePack"

    install -Dm644 readme.txt "$pkgdir/usr/share/licenses/$pkgname/readme.txt"

    install -dm755 "$pkgdir/usr/share/$pkgname/"
    cp -rf data/ host_api/ moon3d/ gles2/ "$pkgdir/usr/share/$pkgname/"
}
