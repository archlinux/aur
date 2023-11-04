# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=(otf-geist otf-geist-mono)
pkgbase=otf-geist-fonts
pkgver=1.0.0
pkgrel=3
pkgdesc='A new font family for Vercel, created by Vercel in collaboration with Basement Studio'
arch=(any)
url=""
license=(OFL)
source=("https://github.com/vercel/geist-font/releases/download/$pkgver/Geist.zip"
        "https://github.com/vercel/geist-font/releases/download/$pkgver/Geist.Mono.zip"
        "https://raw.githubusercontent.com/vercel/geist-font/$pkgver/LICENSE.TXT")
sha256sums=('1c030f65cab740b33094be80686b01517c2072c85ec291daa8fcacfdaca05c7a'
            '0abf741ef7d8c7270ffa1b968c763d654617c9ac980a503ab98c15269325a38b'
            'f38cbd54a72dd027dc854a9bbac9eb5bb8b9b1d6e4b43f037435336ab62a63fc')

_geist_files=(Geist-Black.otf
             Geist-Bold.otf
             Geist-Light.otf
             Geist-Medium.otf
             Geist-Regular.otf
             Geist-SemiBold.otf
             Geist-Thin.otf
             Geist-UltraBlack.otf
             Geist-UltraLight.otf
             GeistVF.ttf
             GeistVF.woff2)

_geist_mono_files=(GeistMono-Black.otf
                  GeistMono-Bold.otf
                  GeistMono-Light.otf
                  GeistMono-Medium.otf
                  GeistMono-Regular.otf
                  GeistMono-SemiBold.otf
                  GeistMono-Thin.otf
                  GeistMono-UltraBlack.otf
                  GeistMono-UltraLight.otf
                  GeistMonoVF.ttf
                  GeistMonoVF.woff2)

package_otf-geist() {
	url='https://vercel.com/font'

	for f in ${_geist_files[@]}
	do
		install -Dm644 "Geist/$f" -t "$pkgdir/usr/share/fonts/Geist"
	done
	install -Dm644 LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_otf-geist-mono() {
	url='https://vercel.com/font/mono'

	for f in ${_geist_mono_files[@]}
	do
		install -Dm644 "Geist Mono/$f" -t "$pkgdir/usr/share/fonts/GeistMono"
	done
	install -Dm644 LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname"
}
