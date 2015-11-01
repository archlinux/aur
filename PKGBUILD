# Maintainer: Lukky513 <lukky513 (a t) gmail (d o t) com>
pkgname=zatikon
pkgver=1.003
pkgrel=3
pkgdesc='Turn-based board strategy game inspired by chess, made by Chronic Logic'
arch=('any')
url="http://www.zatikon.com"
license=('custom:ZatikonEULA')
depends=('java-runtime-jre<=7'
         'hicolor-icon-theme'
         'sh')
install=('zatikon.install')
source=('https://dl.dropboxusercontent.com/s/ww6ibq603fmvck1/zatikon-jars.tar.xz')

package() {
    _gamedir=${pkgdir}/opt/${pkgname}

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	for jarname in zatikon sound art; do
		install -Dm644 ${jarname}.jar ${_gamedir}/${jarname}.jar
	done

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

    for size in 16x16 32x32 48x48 64x64 128x128; do
        install -Dm644 icons/${pkgname}_${size}.png ${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png
    done
    install -Dm644 icons/${pkgname}_128x128.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

md5sums=('f67c04f9c086f198dfc85c5a4a99b284')
sha256sums=('4d8839d5638033769a152b12584f455c9985288852808579e1084eac58966aa0')
