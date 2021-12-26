# Release notes https://rocmdocs.amd.com/en/latest/Current_Release_Notes/Current-Release-Notes.html
major='21.40.2'
minor='1350682'
rocm_major='40502'
rocm_minor='164'
amdgpu_repo='https://repo.radeon.com/amdgpu/21.40.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/4.5.2'
opencl_lib='opt/rocm-4.5.2/opencl/lib'
rocm_lib='opt/rocm-4.5.2/lib'
hip_lib='opt/rocm-4.5.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL userspace driver as provided in the amdgpu-pro driver stack. This package is intended to work along with the free amdgpu stack."
pkgver=${major}.${minor}
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
conflicts=('rocm-opencl-runtime')

source=(
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-llvm/rocm-llvm_13.0.0.21432.40502_amd64.deb"
)

sha256sums=(
"abf2fff149b37fcd7deeac89124ba519d5efe77bb989d79e09020deb07d2feb3"
)

#Extract .xz files
exz() {
	ar x $1
	tar xJf data.tar.xz
}
#Extract .gz files
egz() {
	ar x $1
	tar xfx data.tar.gz
}

package() {
	exz "${srcdir}/rocm-llvm_13.0.0.21432.40502_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
}