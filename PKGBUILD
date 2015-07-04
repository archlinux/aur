# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: C0DEA350
# Contributor: sancspi <sancospi [at] gmail.com>
# Contributor: tze <tze@datalove.me>

pkgname=jcryptool
pkgver=0.9.8
pkgrel=1
epoch=1
pkgdesc="A cryptographer's e-learning application. You can use it to apply and analyse cryptographic algorithms."
arch=('i686' 'x86_64')
license=('EPL')
url="http://www.cryptool.org/en/jcryptool"
depends=('java-environment' 'python2' 'libxext' 'libxrender' 'fontconfig')
install=jcryptool.install
_arch='x86_64'
[ "$CARCH" = 'i686' ] && _arch='x86'
[ "$CARCH" = 'i686' ] && sha512sums[0]='5440c3072ca72474286a6b148db3366e356e4987e890c3f1ad8dd09390fbf16b1815f98ae9b8c714020d067a468ccaae42e17fce0007fc9932539b0a0a22d5ee'
source=(
http://www.cryptool.org/jctdownload/Builds/downloads/stable/${pkgname}-${pkgver}-linux.gtk.${_arch}.tar.gz
jcryptool.desktop
jcryptool.png
)

prepare() {
    cd "$srcdir/$pkgname"
    find . -type f -iname "*.py" -exec sed -i "s#/usr/bin/python#/usr/bin/env python2#g" {} \;
}

package() {
	install -dm644 ${pkgdir}/opt/${pkgname}
	cp -ar ${pkgname} ${pkgdir}/opt

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

}

sha512sums=('19ece8644757c02e8fb4ba43f4e4b23cc093d6492fe4cb7f1d5a4f37dc60f83a43d387c2b7bc7f5293cbdbe793f8870d7ebc2cfba86b8a1f4edfe52f0dd7e083'
            'd0bd2e8b4a52b52280c9dcf45ae1e1db11876dfe6cefd34e095f5218c4c9fabb1abefcd38c92f74e3ef1b825794d720655dc45a03f08cbfc3f5b01f1f5994302'
            'e5e0ac2721ad3919b85fdf7da2fc14d491e89965aabf4c7ca6db840b70bd72ca37ddb63222ee21727607348651125fb34c5e62c2cb9d49e5856678187cb35f6c')
