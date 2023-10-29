# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=(otf-geist otf-geist-mono)
pkgbase=otf-geist-fonts
pkgver=1.0.0
pkgrel=1
pkgdesc='A new font family for Vercel, created by Vercel in collaboration with Basement Studio'
arch=(any)
url=""
license=(OFL)
source=("https://github.com/vercel/geist-font/releases/download/$pkgver/Geist.zip"
        "https://github.com/vercel/geist-font/releases/download/$pkgver/Geist.Mono.zip"
        "https://raw.githubusercontent.com/vercel/geist-font/$pkgver/LICENSE.TXT")
sha256sums=('3d19900ade9c33ba4773f29dcf77b6563335039440de60af3d34b050911eac44'
            '804891b853484797101878e8638391d1d3b1c7b0673a3b0e89a4423664d016d2'
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
		install -Dm644 "$f" -t "$pkgdir/usr/share/fonts/Geist"
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
