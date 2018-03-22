# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=tigrfam
pkgver=15.0
pkgrel=1
pkgdesc='TIGRFAMs is a resource consisting of curated multiple sequence alignments, Hidden Markov Models (HMMs) for protein sequence classification, and associated information designed to support automated annotation of (mostly prokaryotic) proteins.'
arch=('any')
license=('custom')
url="ftp://ftp.jcvi.org"
depends=('hmmer')
makedepends=('bash')
provides=()
path="/pub/data/TIGRFAMs"
source=(
        "$url$path/TIGRFAMs_15.0_HMM.LIB.gz" 
        "$url$path/TIGRFAMs_15.0_HMM.tar.gz"
        "$url$path/TIGRFAMs_15.0_INFO.tar.gz"
        "$url$path/TIGRFAMs_15.0_SEED.tar.gz"
        "$url$path/TIGRFAMS_GO_LINK" 
        "$url$path/TIGRFAMS_ROLE_LINK"
        "$url$path/TIGR_ROLE_NAMES"
	"$url$path/COPYRIGHT"
        )
sha512sums=(
'477b069e03fcf3340df0fea139b76ef377d39775b161707dc2a4d768be6e810a8be9d691f033c636a8c83e5b887b33e399ac52db229881a0c1bad4ce0d18badd'
'c2ef205cb1a817de28ea2277e42719d9762e56583ffc6a66843a79c38f9e5dd8ce530b86d778d622065a123bdb7f7b07127b0c852e96696a3fa3aac9200929f0'
'05ffcc22e836600d08002b51b53a6e792431e0028514fe18b721f8e7eae3b9e5b90c55ca5fb8d0a52c0ffccb383186d7cb4e92f8df4180f287e0ee6bd6b4636d'
'c3d6916857ff35e60c1b133d6b4ee3579bfdc1546003a7b9dc7f5aa76404b470a67ea723b64deb44322e1b94e073de3bf1015b142bd8fc02926ecdf4d746c9ff'
'64a7bf8978485476fff3a6bf99edb7366361b3b5eaf809694748f1dfb2246eec0431c125cca2d92f907d9ce5098fe2c98ab7a9f4b5f9a27a01b4aacb178eaa8e'
'446b04811609d97f5650b6cc5de7e354ffef339b4a1351f535f231e371735d2ea1876890b2fa69bde5eae37c1ae6e138799783f1f0a33c5aba4d66d41f670448'
'c4f9f4a49367b5691cfebca9abe852e151f4295995d6839ac9eff102a47c38b2a8cd6e830a0f0b7dce8c5964687f6646230a9dbcc0bb1790e5e017e574b836e1'
'a72835ce81ec7d289df9b2c17b6618bb4a21d9b2f01d0bf7135510e3fdbb2cafdbb87cdea8c2a74e9e2b8f48e156823f9231ca1a704b7a15c1d60277d60b3861'
)

package() {
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p  "$pkgdir/opt/TIGRFAM/"
  find * -maxdepth 0 -regex '.*\.gz' -prune -o -print0 | xargs -0 -i cp -f {} "$pkgdir/opt/TIGRFAM/"
}
