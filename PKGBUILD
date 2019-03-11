# Maintainer: Shen ZhongLi <szl921818@gmail.com>
#mindmaster 中文版
pkgname=mindmaster-cn
pkgver=6
pkgrel=2
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster")
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
# source_x86_64=("http://download.edrawsoft.com/download/${pkgname}-${pkgver}-amd64.tar.gz")
source_x86_64=("https://www.edrawsoft.cn/2download/mindmaster-6-64-cn.tar.gz")
sha256sums_x86_64=('078544be07b01cf19351eb729b693daaaaf75b4b0a1fcb10b5a2b1631a0381e2')


build() {
  echo "解压缩..."
  tar zxf mindmaster-6-64-cn.tar.gz
#   rm -f mindmaster-6-amd64.tar.gz
pwd
cd ..
  cp mindmaster-cn.desktop ${srcdir}
}

package() {	
	cd "mindmaster-$pkgver-amd64-cn"
	chmod 777 MindMaster-6-x86_64
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p $pkgdir/usr/share/icons
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/mime/packages
	mkdir -p $pkgdir/usr/share/icons/hicolor/512x512/mimetypes
	mv * "$pkgdir/opt/$pkgname"
	cd "$pkgdir/opt/$pkgname"

 	install -Dm755 mindmaster.png "${pkgdir}/usr/share/icons/mindmaster.png"
 	install -Dm755 "${srcdir}/mindmaster-cn.desktop" "${pkgdir}/usr/share/applications/mindmaster-cn.desktop"
	install -Dm755 mindmaster.xml "${pkgdir}/usr/share/mime/packages/mindmaster.xml"
	install -Dm755 emmx.svg "${pkgdir}/usr/share/icons/hicolor/512x512/mimetypes/emmx.svg"
	mkdir "${pkgdir}/usr/bin/"
	ln -f -s /opt/$pkgname/MindMaster-6-x86_64 "${pkgdir}/usr/bin/mindmaster"	
}







