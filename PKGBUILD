# Maintainer: Shen ZhongLi <szl921818@gmail.com>
pkgname=mindmaster
pkgver=6
pkgrel=1
arch=('x86_64')
options=(!strip)
pkgdesc="Draw mind maps and brainstorming diagrams in an automatic way"
license=('Commercial')
source_x86_64=("http://download.edrawsoft.com/download/${pkgname}-${pkgver}-amd64.tar.gz")
#source_x86_64=("https://www.edrawsoft.cn/2download/mindmaster-6-64-cn.tar.gz")
sha256sums_x86_64=('bcc030b5da28adf8455a8a01c0ce5c74659c7ef1fa51b681133321e70a354d65')


build() {
  echo "Extracting files..."
  tar zxf mindmaster-6-amd64.tar.gz
#   rm -f mindmaster-6-amd64.tar.gz
pwd
cd ..
  cp mindmaster.desktop ${srcdir}
}

package() {	
	cd "$pkgname-$pkgver-amd64"
	chmod 777 MindMaster-6-x86_64
	mkdir -p "$pkgdir/opt/$pkgname"
	mv * "$pkgdir/opt/$pkgname"
	cd "$pkgdir/opt/$pkgname"	
 	install -Dm755 mindmaster.png "${pkgdir}/usr/share/icons/mindmaster.png"
 	install -Dm755 "${srcdir}/mindmaster.desktop" "${pkgdir}/usr/share/applications/mindmaster.desktop"
	install -Dm755 mindmaster.xml "${pkgdir}/usr/share/mime/packages/mindmaster.xml"
	install -Dm755 emmx.svg "${pkgdir}/usr/share/icons/hicolor/512x512/mimetypes/emmx.svg"
	mkdir "${pkgdir}/usr/bin/"
	ln -f -s /opt/$pkgname/MindMaster-6-x86_64 "${pkgdir}/usr/bin/mindmaster"	
}







