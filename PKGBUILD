# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Antonis G. <capoiosct at gmail dot com>
# Contributor: Apostolos Bessas <mpessas at gmail dot com>

pkgname=otf-gfs
pkgver=20191228
pkgrel=1
pkgdesc='Selection of open type fonts from the Greek Font Society.'
arch=(any)
url='http://www.greekfontsociety-gfs.gr'
license=('custom')
makedepends=('unzip')
depends=()

source=("http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Pyrsos.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Orpheus_Sans.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Orpheus.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Elpis.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Theokritos.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Artemisia.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_NeoHellenic.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Olga.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Bodoni.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Didot_Display.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Didot.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Goschen.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Philostratos.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Orpheus_Classic.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Decker.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Solomos.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Porson.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Didot_Classic.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Gazis.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Baskerville.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Bodoni_Classic.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Complutum.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Galatea.zip"
	"LICENSE")
noextract=(${source[@]##*/})
md5sums=('ad4bce50a20830c93bc6e4437f674e95'
         'ed0fd6e096eaa27f1e4d75dab59b353b'
         'fc4b7dd7537e5cd0b700bb897d71ae18'
         'b099427d71fdccb23820e386be8ccbd7'
         'c557a9e9e366b938d4c85ef15059b868'
         '3cba29df7b102c10c1612f15d0b6b6d3'
         '2672799c089cc78212046e7effcd0b3b'
         'f07c7b92d98a99bfbab579b8780a922d'
         '2409b756a28631aae2912004c2a867e9'
         '55684035c46a240699d3d13b34c6affe'
         '7294978fb48cec9317d68d68378f2abb'
         '561eb499d90c5ba3606c9f4b5ed75f09'
         '81dedf8a53a2b0404a097c9504ebe19b'
         '77c82259cf77c40f0a647d8e54780f37'
         'b2b4c8db6c51a7db93d614b29387ac42'
         '0c63e5ce5d1949d7ea98cf99baa53096'
         'b837d9b9945f67d6b88ab7572eb0a00c'
         '2a29df9769ce7b3be5d995aadb3283ab'
         'a4c893f33da31e6152b5bd06c516b52d'
         'a4f88fe7b6a598c5ed12f6c54dc03a8f'
         'a581c49e12f5feed39c56135b47a2f55'
         'b6857e9252be1141ad48276c7fc0a6b0'
         'a917bb1f02f0c19b564fddf956d505f7'
         '288069c8fb0c828b081833cfcfe0638b')

package() {
cd "$srcdir"
_xlist="__MACOSX/* .OFL-FAQ.txt OFL-FAQ.txt OFL.txt"
unzip GFS_Pyrsos.zip -x ${_xlist}
unzip GFS_Orpheus_Sans.zip -x ${_xlist}
unzip GFS_Orpheus.zip -x ${_xlist}
unzip GFS_Elpis.zip -x ${_xlist}
unzip GFS_Theokritos.zip -x ${_xlist}
unzip GFS_Artemisia.zip -x ${_xlist}
unzip GFS_NeoHellenic.zip -x ${_xlist}
unzip GFS_Olga.zip -x ${_xlist}
unzip GFS_Bodoni.zip -x ${_xlist}
unzip GFS_Didot_Display.zip -x ${_xlist}
unzip GFS_Didot.zip -x ${_xlist}
unzip GFS_Goschen.zip -x ${_xlist}
unzip GFS_Philostratos.zip -x ${_xlist}
unzip GFS_Orpheus_Classic.zip -x ${_xlist}
unzip GFS_Decker.zip -x ${_xlist}
unzip GFS_Solomos.zip -x ${_xlist}
unzip GFS_Porson.zip -x ${_xlist}
unzip GFS_Didot_Classic.zip -x ${_xlist}
unzip GFS_Gazis.zip -x ${_xlist}
unzip GFS_Baskerville.zip -x ${_xlist}
unzip GFS_Bodoni_Classic.zip -x ${_xlist}
unzip GFS_Complutum.zip -x ${_xlist}
unzip GFS_Galatea.zip -x ${_xlist}

install -d $pkgdir/usr/share/fonts/$pkgname/
install -Dm644 $srcdir/GFS*/*otf $pkgdir/usr/share/fonts/$pkgname/
install -d $pkgdir/usr/share/licenses/$pkgname/
install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
