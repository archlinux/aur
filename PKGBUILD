# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=benben
pkgdesc='Multi-format, fast and efficient command line audio player and audio converter'
pkgver=0.7.1
pkgrel=1
arch=(x86_64)
license=(AGPL-3.0-or-later)
depends=(
	alsa-lib
	libao
	libsidplayfp
	libxmp
	libyaml
	mpg123
	opus
	slang
	wavpack
	zstd
)
makedepends=(
	fossil
	git
	gzip
	meson
	ninja
	python-docutils
	sbcl
	texinfo
)
options=(!strip)
url=https://chiselapp.com/user/MistressRemilia/repository/benben

declare -a _git_repo_names
declare -A _git_repo_urls
declare -A _git_repo_commits

_git_name_from_url () {
	local name
	name=${1##*/}
	echo "${name%.git}"
}

_git_source () {
	local commit url name
	commit=$1
	url=$2
	name=$(_git_name_from_url "$url")
	_git_repo_names+=("$name")
	_git_repo_urls[$name]=$url
	_git_repo_commits[$name]=$commit
}

#
# The list of third party dependency Lisp modules is picked from
# the dev-scripts/build-benben-lisp-x86-64-appimage.rb file.
#
_git_source "8514d8e68ed0c733abf7f96f9e91b24912686dc4" "https://gitlab.common-lisp.net/alexandria/alexandria.git"
_git_source "23c14409dc89538b8a0bb2667a9784a5a72b795f" "https://github.com/cl-babel/babel.git"
_git_source "48eaef6f64c2c4830f3a1104432c66e6bad721a4" "https://github.com/cffi/cffi.git"
_git_source "a2ea581c23fdc184168423adbd4b4c1f48d42743" "https://github.com/edicl/cl-ppcre.git"
_git_source "c1e3ae5722c480e69be9eab2369d6ae0f7d4fb9e" "https://github.com/muyinliu/cl-cpus" ## v0.0.3
_git_source "fc7380b0f5683a6f531150c4bfca724a621cfc0b" "https://codeberg.org/shinmera/trivial-indent.git"
_git_source "4a0025bcc5b6921454822f1b9f38f697b4eeaf43" "https://github.com/marijnh/ST-JSON"
_git_source "70225f4b234d5765cd833d4b9a3c094976540c49" "https://github.com/sharplispers/lparallel"
_git_source "3474f6414b73d4e3aa2d5c53080f4247a34f6380" "https://github.com/trivial-garbage/trivial-garbage.git"
_git_source "2f0c95e7451def47df5919227f299b64d4a0464e" "https://github.com/glv2/cl-zstd"
_git_source "45e0ff7f15a96ae9aef02b977375c6984d57a608" "https://github.com/fukamachi/quri.git"
_git_source "a0e73bb48ef03adea94a55986cc27f522074c8e1" "https://github.com/ruricolist/FXML.git"
_git_source "6f803684415704114f213c64e13b231627e7777f" "https://github.com/sharplispers/chipz.git"
_git_source "d249a62aaf022902398a7141ae17217251fc61db" "https://github.com/trivial-features/trivial-features.git"
_git_source "a7ead683666849762ea657dac9137d693c5a4929" "https://github.com/trivial-gray-streams/trivial-gray-streams.git"
_git_source "cb9e48758a51ddf3296b56c41ce0006617b00916" "https://github.com/sharplispers/parse-number.git" ## v1.8
_git_source "4aa13eb422bacd092c43abdade2943f5966bbff3" "https://github.com/sionescu/bordeaux-threads.git"
_git_source "f461922999ba022325aab6f157234b926514e720" "https://codeberg.org/glv/cl-octet-streams.git" ## v1.2
_git_source "89a10b4d697f03eb32ade3c373c4fd69800a841a" "https://github.com/sharplispers/split-sequence.git"
_git_source "6b4de39201d439330aec0b3589931aa3be570e66" "https://github.com/Publitechs/cl-utilities.git"
_git_source "bf789e6029b695ecba635964deac38130f55c7b4" "https://github.com/antifuchs/idna.git" ## 0.2.2
_git_source "4951d575b8f73270802a03cc5812b8310409caa9" "https://github.com/edicl/flexi-streams.git" ## v1.0.20
_git_source "8bd0045267007f03d7a59211d4446a1d8aa7c26c" "https://github.com/melisgl/named-readtables.git"
_git_source "18f1d93b962781f273d2362bd190ce1744c120c4" "https://github.com/melisgl/mgl-pax.git"
_git_source "4d4af9871c310f2fa57de7478841d88eaad3889d" "https://github.com/edicl/cl-who.git"
_git_source "5959fd0f2deeaeaf4709feff84038691b0974eae" "https://github.com/ruricolist/serapeum.git"
_git_source "4383dd894f7c9861673aad78d8f09e5587bc9616" "https://github.com/guicho271828/trivia.git"
_git_source "4407a6852e76e795f697180dfb01749b49cc7b0c" "https://github.com/guicho271828/type-i.git"
_git_source "26cf129a03b45d6dd7d2a659622244d20a9ab6f5" "https://gitlab.common-lisp.net/iterate/iterate.git" ## 1.5.4
_git_source "69a50ac84b4c23447521dfab008cc20e4bfbee82" "https://github.com/Bike/introspect-environment.git"
_git_source "699fccb6727027343bb5fca69162a3113996edfc" "https://github.com/guicho271828/lisp-namespace.git"
_git_source "2ada8722dc1d7bae1f49832a2ca26b25b90055d3" "https://github.com/Zulu-Inuoe/trivial-cltl2.git"
_git_source "718c761e33749e297cd2809c7ba3ade1985c49f7" "https://github.com/pkhuong/string-case.git"
_git_source "549aebbfb9403a7fe948654126b9c814f443f4f2" "https://gitlab.common-lisp.net/parse-declarations/parse-declarations.git"
_git_source "60fd1bf8c573c733a775580cb96abdaaa7413ba8" "https://github.com/ruricolist/trivial-file-size.git"
_git_source "933270ac7107477de1bc92c1fd641fe646a7a8a9" "https://github.com/cbaggers/trivial-macroexpand-all.git"
_git_source "c749f32c9b606a1457daa47d59630708ac0c266e" "https://github.com/lmj/global-vars.git"
_git_source "2ed394658373e061ee08a0a1dcbf77ee40ae7e15" "https://github.com/pcostanza/closer-mop.git"
_git_source "a0a33af4ad0a6e4cffd6217c3f21a2bfa7e97b2a" "https://codeberg.org/shinmera/trivial-arguments.git"
_git_source "ff170cbf8028185e6a011678033954669bf6dfdc" "https://codeberg.org/shinmera/atomics.git"
_git_source "0665d6e43d135d02658292ac1dae3b17ff426889" "https://codeberg.org/shinmera/documentation-utils.git"
_git_source "97d2de19807a7510fd1c4dd5c6845bf66f6722da" "https://codeberg.org/shinmera/mmap.git"
_git_source "c4a90bd10f0a0de9e893c7ac191009fc8323db2e" "https://codeberg.org/shinmera/pathname-utils.git"
_git_source "607a5d5b95387c06f92a661aa5562a7be0f5cad8" "https://github.com/stylewarning/computable-reals.git"
_git_source "d7ac217819e9156abe10cd28ba7a2d548be03cad" "https://github.com/fukamachi/dexador.git"
_git_source "2232fc9b1e03313f9357824125b4a5327ec7b84b" "https://github.com/fukamachi/fast-http.git"
_git_source "3afe2b76f42f481f44a0a495256f7abeb69cef27" "https://github.com/fukamachi/proc-parse.git"
_git_source "5ce430b3da5cda3a73b9cf5cee4df2843034422b" "https://github.com/fukamachi/xsubseq.git"
_git_source "619759d8a6f821773bbc65c0bda553d30e51e6f3" "https://github.com/fukamachi/smart-buffer.git"
_git_source "a4c5ad600425842e8b6233b1fa22610ffcd874c3" "https://github.com/rpav/fast-io.git"
_git_source "3d9d89b4950b72e0e5bdacfcdfd366bde72386d2" "https://github.com/sionescu/static-vectors.git"
_git_source "5cd13fe0f6268d0bc580f49b0bc70227fe03ecf3" "https://github.com/edicl/chunga.git"
_git_source "fea5b154ad02e8eb68434c31770be6913c099d64" "https://github.com/dlowe-net/local-time.git"
_git_source "01cb46b062d6804ce707352e3de593c104f1cdeb" "https://codeberg.org/shinmera/trivial-mimes.git"
_git_source "6bcb74ac6fb331f9677cdc98c5b0b9f92246d6a7" "https://github.com/fukamachi/cl-cookie.git"
_git_source "80496b74293e956364b2d3dbdfc87d74bfeeeda4" "https://github.com/darabi/cl-base64.git"
_git_source "6456a3f7ece05c8b8f077dd079daffb8de122ead" "https://github.com/usocket/usocket.git"
_git_source "e6963f24a2ad2a8c3fc113697bae54e0f15c05b0" "https://github.com/cl-plus-ssl/cl-plus-ssl.git"

source=(
    "fossil+$url#tag=v$pkgver"
    'fossil+https://chiselapp.com/user/MistressRemilia/repository/cl-sdm/#tag=v0.99.38'
    'fossil+https://chiselapp.com/user/MistressRemilia/repository/cl-remimarshal/#tag=v0.4.3'
    'fossil+https://nanako.mooo.com/fossil/cl-remiyaml/#tag=v0.2.1'
    'fossil+https://chiselapp.com/user/MistressRemilia/repository/cl-remiaudio/#tag=v0.1.3'
    'fossil+https://nanako.mooo.com/fossil/cl-remichips/#tag=v0.1.3'
    'fossil+https://chiselapp.com/user/MistressRemilia/repository/cl-remi-slang/#tag=v0.2.1'
    'fossil+https://nanako.mooo.com/fossil/satousynth/#tag=v0.1.4'
	'fossil+https://nanako.mooo.com/fossil/libremicsid/#commit=f52087551c9a39bdfa879ab49d2ff73ade3aa5ec884c7e4f7ee9875d595e5f7c'
)
b2sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

for name in "${_git_repo_names[@]}" ; do
	source+=("git+${_git_repo_urls[$name]}#commit=${_git_repo_commits[$name]}")
	b2sums+=(SKIP)
done

export USER=nobody

prepare () {
	cd "$srcdir"

	rm -rf _asdf_registry
	mkdir -p _asdf_registry

	local name asd_file asd_file_basename
	for asd_file in "$(pwd)"/*/*.asd "$(pwd)"/*/*/*.asd ; do
		asd_file_basename=${asd_file##*/}
		ln -snf "$asd_file" "_asdf_registry/$asd_file_basename"
	done
}

build () {
	# Build libremicsid first
	rm -rf _libremicsid_build
	arch-meson _libremicsid_build libremicsid
	meson compile -C _libremicsid_build

	cd "$pkgname"

	local program dummy
	for program in benben remote-benben ; do
		for dummy in pass1 pass2 ; do
			LD_LIBRARY_PATH="$(pwd)/../_libremicsid_build" \
			REMOTE_BENBEN_COMPRESS=1 \
			BENBEN_COMPRESS=1 \
			BENBEN_NO_SIMD=1 \
			BENBEN_OPT_MODE=release \
				sbcl \
				--dynamic-space-size 8192 \
				--disable-ldb \
				--merge-core-pages \
				--no-userinit \
				--disable-debugger \
				--eval '(require :asdf)' \
				--eval '(require :sb-posix)' \
				--eval "(push #P\"$(pwd)/../_asdf_registry/\" asdf:*central-registry*)" \
				--load "build-scripts/build-$program.lisp"
		done
	done

	# Documentation
	rst2man man/benben.1.rst man/benben.1
	texi2any --info --no-split -o man/texi/benben.{info,texi}
}

package () {
	meson install -C _libremicsid_build --destdir="$pkgdir"

	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" bin/{remote-,}benben
	install -Dm644 -t "$pkgdir/usr/share/man/man1" man/benben.1
	install -Dm644 -t "$pkgdir/usr/share/info" man/texi/benben.info
}
