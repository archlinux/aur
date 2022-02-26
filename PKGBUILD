pkgbase=overtone-wpc
pkgname=("${pkgbase}-af210-vst-bin" "${pkgbase}-af210m-vst-bin" "${pkgbase}-dyn500-vst-bin" "${pkgbase}-eq500-vst-bin" "${pkgbase}-fc70-vst-bin" "${pkgbase}-ptc2a-vst-bin" "${pkgbase}-ptm5a-vst-bin" "${pkgbase}-rvb500-vst-bin")
pkgver=201904
pkgrel=3
arch=('x86_64')
url="https://www.overtonedsp.co.uk/download/download_wpc/"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## plugin AVA Plugins Archive
	_archive=`xdg-user-dir DOWNLOAD`/$pkgbase-RD${pkgver}.zip
	if [ -f ${_archive} ]; then
		ln -s ${_archive} $srcdir/$pkgbase-RD${pkgver}.zip
		cd $srcdir
		unzip $srcdir/$pkgbase-RD${pkgver}.zip
	else
		echo "Please download a copy from https://www.overtonedsp.co.uk/download/download_wpc/ Then put the `basename ${_archive}` in the `xdg-user-dir DOWNLOAD` directory"
	fi
}


package_overtone-wpc-af210-vst-bin() {
	pkgdesc="OvertoneDSP AF210 - Graphical EQ (VST)"
	cd $srcdir/OverToneWPC/AF210/Linux
	tar -xvzf *.tar.gz
	install -Dm644 AF210/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-AF210.txt
	install -Dm644 AF210/manual.pdf $pkgdir/usr/share/doc/$pkgbase/AF210.pdf
	cd AF210/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 AF210.so $pkgdir/usr/lib/vst/AF210.so
}

package_overtone-wpc-af210m-vst-bin() {
	pkgdesc="OvertoneDSP AF210M - Graphical EQ (VST)"
	cd $srcdir/OverToneWPC/AF210M/Linux
	tar -xvzf *.tar.gz
	install -Dm644 AF210M/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-AF210M.txt
	install -Dm644 AF210M/manual.pdf $pkgdir/usr/share/doc/$pkgbase/AF210M.pdf
	cd AF210M/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 AF210M.so $pkgdir/usr/lib/vst/AF210M.so
}

package_overtone-wpc-dyn500-vst-bin() {
	pkgdesc="OvertoneDSP DYN500 - Channel Dynamic Range Compressor (VST)"
	cd $srcdir/OverToneWPC/DYN500/Linux
	tar -xvzf *.tar.gz
	install -Dm644 DYN500/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-DYN500.txt
	install -Dm644 DYN500/manual.pdf $pkgdir/usr/share/doc/$pkgbase/DYN500.pdf
	cd DYN500/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 DYN500.so $pkgdir/usr/lib/vst/DYN500.so
}

package_overtone-wpc-eq500-vst-bin() {
	pkgdesc="OvertoneDSP EQ500 - Analogue Filter Modelling Channel EQ (VST)"
	cd $srcdir/OverToneWPC/EQ500/Linux
	tar -xvzf *.tar.gz
	install -Dm644 EQ500/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-EQ500.txt
	install -Dm644 EQ500/manual.pdf $pkgdir/usr/share/doc/$pkgbase/EQ500.pdf
	cd EQ500/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 EQ500.so $pkgdir/usr/lib/vst/EQ500.so
}

package_overtone-wpc-fc70-vst-bin() {
	pkgdesc="OvertoneDSP FC70 - Vintage Compressor / Limiter Plug-in (VST)"
	cd $srcdir/OverToneWPC/FC70/Linux
	tar -xvzf *.tar.gz
	install -Dm644 FC70/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-FC70.txt
	install -Dm644 FC70/manual.pdf $pkgdir/usr/share/doc/$pkgbase/FC70.pdf
	cd FC70/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 FC70.so $pkgdir/usr/lib/vst/FC70.so
}

package_overtone-wpc-ptc2a-vst-bin() {
	pkgdesc="OvertoneDSP PTC-2A - Vintage Program EQ Plug-in (VST)"
	cd $srcdir/OverToneWPC/PTC-2A/Linux
	tar -xvzf *.tar.gz
	install -Dm644 PTC-2A/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-PTC-2A.txt
	install -Dm644 PTC-2A/manual.pdf $pkgdir/usr/share/doc/$pkgbase/PTC-2A.pdf
	cd PTC-2A/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 PTC-2A.so $pkgdir/usr/lib/vst/PTC-2A.so
}

package_overtone-wpc-ptm5a-vst-bin() {
	pkgdesc="OvertoneDSP PTM-5A - Vintage Mid-Range EQ Plug-in (VST)"
	cd $srcdir/OverToneWPC/PTM-5A/Linux
	tar -xvzf *.tar.gz
	install -Dm644 PTM-5A/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-PTM-5A.txt
	install -Dm644 PTM-5A/manual.pdf $pkgdir/usr/share/doc/$pkgbase/PTM-5A.pdf
	cd PTM-5A/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 PTM-5A.so $pkgdir/usr/lib/vst/PTM-5A.so
}

package_overtone-wpc-rvb500-vst-bin() {
	pkgdesc="OvertoneDSP RVB500 - Stereo Plate Reverb (VST)"
	cd $srcdir/OverToneWPC/RVB500/Linux
	tar -xvzf *.tar.gz
	install -Dm644 RVB500/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-RVB500.txt
	install -Dm644 RVB500/manual.pdf $pkgdir/usr/share/doc/$pkgbase/RVB500.pdf
	cd RVB500/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 RVB500.so $pkgdir/usr/lib/vst/RVB500.so
}
