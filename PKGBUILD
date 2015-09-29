pkgname=ensime-server
pkgver=0.9.10
_scalaver=2.11.6
_kind=SNAPSHOT
pkgrel=1
pkgdesc="ENSIME server"
url="https://github.com/ensime/ensime-server"
arch=("x86_64" "i686")
license="custom"
depends=("java-environment-jdk")
_jarfile="ensime_${_scalaver}-${pkgver}-${_kind}-assembly.jar"
source=("http://ensime.typelevel.org/${_jarfile}"
        "ensime-server.sh"
        "ensime-server@.service")
noextract=("${_jarfile}")
md5sums=('a40de1ec974ad6181f6d4cbe25b29ad0'
         'd30b6d1a7d27ad8978a32fcf9d5c663a'
         '4cbcba55bfb1883a093c76c04fa8b6c4')
sha256sums=('517bf1567e281fcbedd8aaa7298259fada77249df8c661c502a00b2c469deb40'
            '0cb44a410c4f2018992f8f3648c2a6fc097cc94442d37f40db94e5f8539befd1'
            'bdd26cd67a1338386201ae1bb058794c8230d328083e520eed7f481e3020b3f8')

build() {
    echo ""
}

package() {
    mkdir -p "${pkgdir}/usr/lib/ensime" && \
    cp "${srcdir}/${_jarfile}" "${pkgdir}/usr/lib/ensime"
    install -D -m0755 "${srcdir}/ensime-server.sh" "${pkgdir}/usr/bin/ensime-server"
    install -D -m0644 "${srcdir}/ensime-server@.service" "${pkgdir}/usr/lib/systemd/user/ensime-server@.service"
}
